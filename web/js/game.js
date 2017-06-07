import $ from "jquery";
import {fakeAjax, ajaxHelper} from "./ajax-helper.js";

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
    login: (username) => {
        $userPanel.find(".username").html(username);
        $userPanel.find(".points").html(0);
        $userPanel.addClass("is-visible");
        user.isLoggedIn = true;
        $loginForm.find("input").val("");
        userActions.onCategoryBtnClick(user.queuedEv);
    },
    validateUsername: (username) => {
        return fakeAjax("").then( (data) => Math.random() > .2 );
    }
}

let userActions = {
    onCategoryBtnClick: (ev) => {
        ev.preventDefault();
        let $btn = $(ev.target);
        let type = $btn.attr("data-type");
        let syntax = $btn.attr("data-syntax");

        if (!user.isLoggedIn) return user.showLogin(ev);

        game.changeQuestion(type, syntax).then(() => game.updateScreen(type));
    },

    onNextQuestionClick: (ev) => {
        ev.preventDefault();
        let $btn = $(ev.target);
        let type = $btn.attr("data-type");
        let syntax = $btn.attr("data-syntax");

        game.validateQuestion(type, syntax);
        game.changeQuestion(type, syntax);
    },

    onStartClick: (ev) => {
        ev.preventDefault();

        let $error = $loginForm.find(".error");
        let username = $loginForm.find("input").val();

        $error.removeClass("is-visible");
        if (!username) {
            $error.addClass("is-visible").html("Please enter an username.");
        } else {
            user.validateUsername(username).then((isValid) => {
                if (isValid) {
                    user.login(username);
                } else {
                    $error.addClass("is-visible").html("This username already exists. Please use another one.");
                }
            })
        }
    },

    onExitClick: (ev) => {
        ev.preventDefault();
        game.saveResults();
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

    changeQuestion: (type, syntax) => {
        $nextQuestion.attr("data-type", type).attr("data-syntax", syntax);
        if (type == "editor") {
            return questions.getEditorQuestion(syntax);
        } else {
            return questions.getCheckboxQuestion(syntax);
        }
    },

    validateQuestion: (type, syntax) => {
        let value;
        if (type == "editor") {
            value = $questionBody.find("input").length ? $questionBody.find("input:checked").val() : editor.getValue();
        } else {
            value = $questionAnswers.find("input:checked").val();
        }

        return fakeAjax("").then( (data) => {
            if (Math.random() > .2) {
                $userPanel.find(".points").html(+$userPanel.find(".points").html() + 5);
            }
        });

    },

    saveResults: () => {
        return fakeAjax("").then( (data) => {
            user.isLoggedIn = false;
            $categoryBtn.removeClass("checked");
            $userPanel.removeClass("is-visible");
            game.updateScreen("categories");
        });
    }
}

// change callbacks
function onInputCheckboxChange(ev) {
    $(ev.target).parent().siblings().find("input").prop("checked", false);
}

let questions = {
    getEditorQuestion: (syntax) => {
        return ajaxHelper("/index.php/emag/getQuestion").then( (data) => {
            $questionBody.html(data.question);
            editor.session.setMode(`ace/mode/${syntax}`);
            editor.setValue(data.code);
            editor.resize(true);
            editor.scrollToLine(1);
            editor.gotoLine(1);

            let hasCheckboxes = Math.random() > 0.5;
            if (hasCheckboxes) {
                let answers = [
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam mi ante, interdum sed congue in, vulputate euismod lectus. Pellentesque et ex quis augue venenatis ornare.", 
                    "Fusce elementum lacus nec dolor tempus sagittis. Nulla sed ipsum sed nisl pretium interdum. Donec ac posuere tellus, in mollis nisl.", 
                    "Phasellus faucibus arcu diam, vel varius arcu condimentum non. Proin et justo tempus odio convallis cursus. Etiam ac mauris eget magna rhoncus aliquam.",
                    "Donec semper erat ultrices quam facilisis, eget suscipit arcu mattis. Vivamus hendrerit et quam non posuere."
                ]
                let $optionsWrapper = $("<div class='checkboxes-wrapper pad-l-md'>");
                answers.forEach((answer) => {
                    let $option = $(`<label class="mar-b-sm"><div class="checkbox-placeholder inline--v-middle radius box mar-r-xs shadow"></div>${answer}</label>`);
                    let $input = $(`<input type="checkbox" value="${answer}">`);
                    $input.on("change", onInputCheckboxChange);
                    $option.prepend($input);
                    $optionsWrapper.append($option);
                });
                $questionBody.append($optionsWrapper);
            }
            editor.setReadOnly(hasCheckboxes);
        });
    },

    getCheckboxQuestion: (syntax) => {
        return fakeAjax("").then( (data) => {
            data = {
                "id":"1",
                "question":"Lorem ipsum dolor sit amet, consectetur adipiscing elit?",
                "answers": ["Answer 1", "Answer 2", "Answer 3"]
            };

            $questionBody.html(data.question);
            $questionAnswers.html("");

            data.answers.forEach((answer) => {
                let $option = $(`<label class="mar-b-xs"><div class="checkbox-placeholder inline--v-middle radius box mar-r-xs shadow"></div>${answer}</label>`);
                let $input = $(`<input type="checkbox" value="${answer}">`);
                $input.on("change", onInputCheckboxChange);
                $option.prepend($input);
                $questionAnswers.append($option);
            });
        });
    }
};

export default game;