<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>eMAG</title>
    <link rel="shortcut icon" href="https://s0emagst.akamaized.net/layout/ro/favicon2.ico">
    <link href="/web/style.css" rel="stylesheet">
</head>
<body>
    <div class="bg-top-right"></div>
    <div class="bg-left-bottom"></div>

    <div id="container">
        <div class="box box-white">
            <img src="/web/images/logo.svg" class="logo" alt="eMAG">

            <h2 class="lighten">Our elephpant tried to write some code but got stuck. Now he’s not so happy and he needs your help.</h2>
            <p>Read the problems in the second window, write the code in the third one and see what happens. The elephpant prepared a reward for those who make it!<p>
            <p>If you get stuck too, the eMAG crew will tell you what to do!</p>

            <div class="animal"></div>
            <div class="box-bg"></div>
        </div>

        <div class="box question-body"></div>

        <div class="box box-code">
            <div class="php-open">&lt;?php</div>
            <div class="php-close">?&gt;</div>

            <div class="overlay">
                <div class="error">
                    <span>Error</span>

                    <div><button type="button" class="btn" onclick="resetQuestion()">Try again</button></div>
                    <div><button type="button" class="btn" onclick="getQuestion()">Next question</button></div>
                </div>
                <div class="success">
                    <span>Success</span>

                    <div><button type="button" class="btn" onclick="getQuestion()">Next question</button></div>
                </div>
            </div>

            <pre id="editor" contenteditable="true"></pre>

            <button type="button" class="btn btn-red btn-submit" id="submit-btn" onclick="runCode()">Run code</button>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/web/editor/ace.js"></script>
    <script src="/web/javascript.js"></script>
</body>
</html>