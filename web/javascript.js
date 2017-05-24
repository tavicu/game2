if ( $( "#editor" ).length ) {
	var editor = ace.edit("editor");
	editor.setTheme("ace/theme/terminal");
	editor.session.setMode("ace/mode/php");
    editor.getSession().setUseWrapMode(true);

	editor.setHighlightActiveLine(false);
	editor.setShowPrintMargin(false);

}


var question = null;
document.addEventListener('contextmenu', event => event.preventDefault());

function getQuestion() {
    $('#submit-btn').show();
	$('.overlay').hide().removeClass('error success');
    SetCookie('gameStatus', 'default');

    $.getJSON( "/index.php/emag/getQuestion", function( data ) {
		question = data;

        $('.question-body').html(question.question);
        editor.setValue(question.code);
        editor.resize(true);
        editor.scrollToLine(1);
        editor.gotoLine(1);
    });
}

function resetQuestion() {
    $('#submit-btn').show();
    $('.overlay').hide().removeClass('error success');
    SetCookie('gameStatus', 'default');

    $('.question-body').html(question.question);
    editor.setValue(question.code);
    editor.resize(true);
    editor.scrollToLine(1);
    editor.gotoLine(1);
}

function runCode() {
    $('#submit-btn').hide();
    $.post( "/index.php/emag/sendAnswer", {id: question.id, code: editor.getValue()}, function( data ) {
        if(data == '"fail"') {
            $('.overlay').show().addClass('error');
            SetCookie('gameStatus', 'error');
        } else {
            $('.overlay').show().addClass('success');
            SetCookie('gameStatus', 'ok');
        }
    })
	.fail(function() {
        $('.overlay').show().addClass('error');
        SetCookie('gameStatus', 'error');
	});
}


function SetCookie(cookieName, cookieValue) {
    var today = new Date();
    var expire = new Date();

    expire.setTime(today.getTime() + 3600000*24*5);

    document.cookie = cookieName+"="+escape(cookieValue) + ";expires="+expire.toGMTString() + "; path=/; domain=" + window.location.hostname;
}

function ReadCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');

    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }

    return null;
}



if ( !$( "#monitor" ).length ) {
    getQuestion();
    SetCookie('gameStatus', 'default');
    $('#submit-btn').show();
	$('#container').addClass('on-view');
}

if ( $( "#monitor" ).length ) {
    var lastStatus = '';

    setInterval(function() {
        var cookie = ReadCookie('gameStatus');

        if(cookie && cookie != lastStatus) {
            lastStatus = cookie;

            $( "#monitor > .container" ).css('visibility', 'hidden');
            $( "#monitor > .container.status-" + cookie ).css('visibility', 'visible');
        }
    }, 200);
}