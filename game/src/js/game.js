import $ from "jquery";
import {fakeAjax, ajaxHelper} from "./ajax-helper.js";
import loader from "./loader.js";

let isLoggedIn = false;
let queuedEv;
let editor;

let $container = $(".container");
let $questionBody = $(".question-body");
let $questionAnswers = $(".question-answers");
let $nextQuestion = $(".js-next-question");
let $categoryBtn = $(".js-btn-category");
let $startBtn = $(".js-btn-start");
let $exitBtn = $(".js-btn-exit");
let $userPanel = $(".user-panel");
let $loginForm = $(".js-login");

let user = {
    isLoggedIn: false,
    queuedEv: null,
    showLogin: (qEv) => {
        user.queuedEv = qEv;
        game.updateScreen("login");
        return;
    },
    login: (userId, username) => {
        user.userId = userId;
        user.isLoggedIn = true;

        $userPanel.find(".username").html(username);
        $userPanel.find(".points").html(0);
        $userPanel.addClass("is-visible");
        $loginForm.find("input").val("");
        
        userActions.onCategoryBtnClick(user.queuedEv);
    },

    logout: () => {
        user.isLoggedIn = false;
        $categoryBtn.removeClass("checked");
        $userPanel.removeClass("is-visible");
        game.updateScreen("categories");
    },

    create: (username) => {
        return ajaxHelper("http://devtalks.emag.ro/index.php?emag/registerUser", "POST", {user: username});
        // return fakeAjax("createUser");
    },

    incrementScore: () => {
        $userPanel.find(".points").html(+$userPanel.find(".points").html() + 5);
        ajaxHelper("http://devtalks.emag.ro/index.php?emag/updateScore", "POST", {id: user.userId});
    }
}

let userActions = {
    onCategoryBtnClick: (ev) => {
        ev.preventDefault();
        let $btn = $(ev.target);
        let category = $btn.attr("data-category");

        if (!user.isLoggedIn) return user.showLogin(ev);

        game.getQuestions(category);
    },

    onNextQuestionClick: (ev) => {
        ev.preventDefault();
        question.validate();
        question.change();
    },

    onStartClick: (ev) => {
        ev.preventDefault();

        let $error = $loginForm.find(".error");
        let username = $loginForm.find("input").val();

        $error.removeClass("is-visible");
        if (!username) {
            $error.addClass("is-visible").html("Please enter an username.");
        } else {
            user.create(username).then((newUser) => user.login(newUser.id, newUser.name)).fail((err) => {
                loader.hide();
                $error.addClass("is-visible").html("This username already exists. Please use another one.");
            });
        }
    },

    onExitClick: (ev) => {
        ev.preventDefault();
        user.logout();
    }
}

let game = {

    init: () => {
        if ($("#editor").length) {
            editor = ace.edit("editor");
            editor.setTheme("ace/theme/terminal");
            editor.getSession().setUseWrapMode(true);
            editor.setHighlightActiveLine(false);
            editor.setShowPrintMargin(false);
            editor.renderer.setScrollMargin(25, 25);
            editor.container.style.lineHeight = 1.5;
        }
        
        $nextQuestion.on("click", userActions.onNextQuestionClick);
        $categoryBtn.on("click", userActions.onCategoryBtnClick);
        $loginForm.on("submit", userActions.onStartClick);
        $exitBtn.on("click", userActions.onExitClick);
    },

    updateScreen: (type = "categories") => $container.attr("data-screen", type),

    getQuestions: (category) => {
        // return fakeAjax("getQuestion", category).then( (data) => {
        return ajaxHelper(`http://devtalks.emag.ro/index.php?emag/getQuestions/${category}`, "GET").then( (data) => {
            question.currentCategory = data;
            question.currentIndex = 0;
            question.change();
            $categoryBtn.filter(`[data-category="${category}"]`).addClass("checked");
        });
    }
}

// change callbacks
function onInputCheckboxChange(ev) {
    $(ev.target).parent().siblings().find("input").prop("checked", false);
}

let question = {
    currentIndex: 0,
    currentCategory: [],

    change: () => {
        if (question.currentIndex < question.currentCategory.length) {
            let q = question.currentCategory[question.currentIndex++];
            if (q) {
                if (!q.options) {
                    q.options = [];
                    if (q.option1) q.options.push(q.option1);
                    if (q.option2) q.options.push(q.option2);
                    if (q.option3) q.options.push(q.option3);
                    if (q.option4) q.options.push(q.option4);
                }
                question.render(q);
            }
        } else {
            game.updateScreen();
        }
    },

    generateCheckbox: ($wrapper, answer) => {
        let $option = $(`<label class="mar-b-sm"><div class="checkbox-placeholder inline--v-middle radius box mar-r-xs shadow"></div>${answer}</label>`);
        let $input = $(`<input type="checkbox" value="${answer}">`);
        $input.on("change", onInputCheckboxChange);
        $option.prepend($input);
        $wrapper.append($option);
    },

    render: (q) => {
        $questionBody.html(q.title || "");
        if (!q.title || !q.title.length) {
            $questionBody.addClass("no-title");
        } else {
            $questionBody.removeClass("no-title");
        }
        
        let type;

        if (q.code) {
            editor.setValue(q.code);
            editor.resize(true);
            editor.scrollToLine(1);
            editor.gotoLine(1);
            editor.setReadOnly(q.code && q.options.length);
            type = "editor";
        }

        if (q.options.length) {
            
            if (q.code) {

                let $optionsWrapper = $("<div class='checkboxes-wrapper pad-l-md'>");
                q.options.forEach((answer) => {
                    question.generateCheckbox($optionsWrapper, answer);
                });
                $questionBody.append($optionsWrapper);

            } else {

                $questionAnswers.html("");
                q.options.forEach((answer) => {
                    question.generateCheckbox($questionAnswers, answer);
                });

                type = "checkbox";
            }
        }

        game.updateScreen(type);

    },

    validate: () => {
        let q = question.currentCategory[question.currentIndex-1];

        let value;
        if (q.code) {
            if (q.options.length) {
                if ($questionBody.find("input:checked").val() == q.options[+q.answer - 1]) user.incrementScore();
            } else {
                ajaxHelper("http://devtalks.emag.ro/index.php?emag/sendPHPAnswer", "POST", {id: q.id, code: editor.getValue()}).then( (data) => {
                // fakeAjax("").then( (data) => {
                    if (data) user.incrementScore();
                });
            }
        } else {
            if ($questionAnswers.find("input:checked").val() == q.options[+q.answer - 1]) user.incrementScore();
        }
    }
};

export default game;