import $ from "jquery";

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
let $leaderboard = $(".leaderboard-box ol");

if ($("#editor").length) {
    editor = ace.edit("editor");
    editor.setTheme("ace/theme/terminal");
    editor.getSession().setUseWrapMode(true);
    editor.setHighlightActiveLine(false);
    editor.setShowPrintMargin(false);
    editor.renderer.setScrollMargin(25, 25);
    editor.container.style.lineHeight = 1.5;
}

$nextQuestion.on("click", onNextQuestionClick);
$categoryBtn.on("click", onCategoryBtnClick);
$loginForm.on("submit", onStartClick);
$exitBtn.on("click", onExitClick);

function showLoader() {
    $container.addClass("loading");
}
function hideLoader() {
    $container.removeClass("loading");
}
function updateScreen(type = "categories") {
    $container.attr("data-screen", type);
}

function login(username) {
    $userPanel.find(".username").html(username);
    $userPanel.find(".points").html(0);
    $userPanel.addClass("is-visible");
    isLoggedIn = true;
    $loginForm.find("input").val("");
    onCategoryBtnClick(queuedEv);
}
function displayLogin(qEv) {
    queuedEv = qEv;
    updateScreen("login");
    return;
}

// click callbacks
function onCategoryBtnClick(ev) {
    ev.preventDefault();
    let $btn = $(ev.target);
    let type = $btn.attr("data-type");
    let syntax = $btn.attr("data-syntax");

    if (!isLoggedIn) return displayLogin(ev);

    changeQuestion(type, syntax).then(() => updateScreen(type));
}

function onNextQuestionClick(ev) {
    ev.preventDefault();
    let $btn = $(ev.target);
    let type = $btn.attr("data-type");
    let syntax = $btn.attr("data-syntax");

    validateQuestion(type, syntax);
    changeQuestion(type, syntax);
}

function onStartClick(ev) {
    ev.preventDefault();

    let $error = $loginForm.find(".error");
    let username = $loginForm.find("input").val();

    $error.removeClass("is-visible");
    if (!username) {
        $error.addClass("is-visible").html("Please enter an username.");
    } else {
        validateUsername(username).then((isValid) => {
            if (isValid) {
                login(username);
            } else {
                $error.addClass("is-visible").html("This username already exists. Please use another one.");
            }
        })
    }
}

function onExitClick(ev) {
    ev.preventDefault();
    saveResults();
}

// change callbacks
function onInputCheckboxChange(ev) {
    $(ev.target).parent().siblings().find("input").prop("checked", false);
}

// question actions
function changeQuestion(type, syntax) {
    $nextQuestion.attr("data-type", type).attr("data-syntax", syntax);
    if (type == "editor") {
        return getEditorQuestion(syntax);
    } else {
        return getCheckboxQuestion(syntax);
    }
}

function validateQuestion(type, syntax) {
    let value;
    if (type == "editor") {
        value = editor.getValue();
    } else {
        value = $questionAnswers.find("input:checked").val();
    }
    return fakeAjax("", (data) => {
        if (Math.random() > .2) {
            $userPanel.find(".points").html(+$userPanel.find(".points").html() + 5);
        }
    });

}

function validateUsername(username) {
    return fakeAjax("", (data) => {
        return Math.random() > .2
    });
}

function saveResults() {
    return fakeAjax("", (data) => {
        isLoggedIn = false;
        $categoryBtn.removeClass("checked");
        $userPanel.removeClass("is-visible");
        updateScreen("categories");
    });
}

// ajax callbacks
function getEditorQuestion(syntax) {
    return ajaxHelper("/index.php/emag/getQuestion", (data) => {
        $questionBody.html(data.question);
        editor.session.setMode(`ace/mode/${syntax}`);
        editor.setValue(data.code);
        editor.resize(true);
        editor.scrollToLine(1);
        editor.gotoLine(1);
    });
}

function getCheckboxQuestion(syntax) {
    return fakeAjax("", (data) => {
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

function getLeaderboard() {
    fakeAjax("", (data) => {
        const leaderboard = [
            {score: 999, name: "Ionut Popescu"},
            {score: 998, name: "Ionut Popescu"},
            {score: 997, name: "Ionut Popescu"},
            {score: 996, name: "Ionut Popescu"},
            {score: 995, name: "Ionut Popescu"},
            {score: 994, name: "Ionut Popescu"},
            {score: 993, name: "Ionut Popescu"},
            {score: 992, name: "Ionut Popescu"},
            {score: 991, name: "Ionut Popescu"},
            {score: 990, name: "Ionut Popescu"},
        ];

        $leaderboard.html("");
        for (let idx in leaderboard) {
            let person = leaderboard[idx];
            $leaderboard.append(`<li><div class="score inline--v-middle mar-hrz-md">${person.score}</div>${person.name}</li>`);
        }
    });
}

if ($leaderboard.length) getLeaderboard();

// ajax helper
function fakeAjax(url, cb) {
    showLoader();
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve(cb({
                "id":"1",
                "question":"Lorem ipsum dolor sit amet, consectetur adipiscing elit?",
                "answers": ["Answer 1", "Answer 2", "Answer 3"]
            })); 
            hideLoader();
        }, 1000);
    })
}

function ajaxHelper(url, cb) {
    showLoader();
    return $.getJSON(url, (data) => {
        cb(data);
        hideLoader();
    });
}