<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>eMAG</title>
    <link rel="shortcut icon" href="https://s0emagst.akamaized.net/layout/ro/favicon2.ico">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="/web/dist/css/app.css" rel="stylesheet">
</head>
<body>
    <div>
        <div class="bg bg-hrz bg-top"></div>
        <div class="bg bg-hrz bg-bottom"></div>
        <div class="bg bg-vrt bg-left"></div>
        <div class="bg bg-vrt bg-right"></div>
    </div>

    <div class="container text-center" data-screen="categories"><!--
     --><div class="user-panel text-right">
            <div class="user-details text-left mar-b-xs">
                <div class="user-icon fa fa-user inline--v-middle mar-r-xs"></div><!-- 
             --><div class="inline--v-middle">
                    <div class="username"></div>
                    <div class="points"></div>
                </div>
            </div>
            <button class="btn js-btn-exit text-center radius pad-hrz-sm">Exit challenge</button>
        </div><!-- 
     --><div class="content inline--v-middle">
            <div>
                <img src="/web/images/logo-devTalks.svg" class="inline--v-bottom pad-hrz-sm logo-img logo-devTalks">
                <img src="/web/images/logo-emag.svg" class="inline--v-bottom pad-hrz-sm logo-img logo-emag mar-b-neg-xs">
            </div>
            <div class="screens">
                <div class="screen categories">
                    <div>
                        <a href="#" class="box radius shadow font-bold inline--v-middle mar-hrz-sm mar-vrt-sm pad-hrz-xs pad-vrt-md btn-category js-btn-category checked" data-type="editor" data-syntax="scala">Scala/Java Syntax</a>
                        <a href="#" class="box radius shadow font-bold inline--v-middle mar-hrz-sm mar-vrt-sm pad-hrz-xs pad-vrt-md btn-category js-btn-category" data-type="checkbox">Big Data Technologies</a>
                        <a href="#" class="box radius shadow font-bold inline--v-middle mar-hrz-sm mar-vrt-sm pad-hrz-xs pad-vrt-md btn-category js-btn-category" data-type="editor" data-syntax="sql">SQL</a>
                    </div>
                    <div>
                        <a href="#" class="box radius shadow font-bold inline--v-middle mar-hrz-sm mar-vrt-sm pad-hrz-xs pad-vrt-md btn-category js-btn-category" data-type="editor" data-syntax="php">PHP</a>
                        <a href="#" class="box radius shadow font-bold inline--v-middle mar-hrz-sm mar-vrt-sm pad-hrz-xs pad-vrt-md btn-category js-btn-category" data-type="checkbox">Agile methodology</a>
                        <a href="#" class="box radius shadow font-bold inline--v-middle mar-hrz-sm mar-vrt-sm pad-hrz-xs pad-vrt-md btn-category js-btn-category" data-type="checkbox">eMAG Technologies</a>
                    </div>
                </div>
                <div class="screen login">
                    <form class="box radius shadow inline--v-middle pad-hrz-xl pad-vrt-l js-login">
                        <input type="text" class="font-light radius inline--v-middle mar-hrz-xs pad-hrz-sm pad-vrt-xs" placeholder="Username">
                        <button class="font-light radius btn js-btn-start inline--v-middle mar-hrz-xs pad-hrz-sm pad-vrt-xs">Start challenge</button>
                        <div class="error mar-t-sm mar-b-neg-sm"></div>
                    </form>
                </div>
                <div class="screen question text-left">
                    <div class="inline--v-top question-body font-bold"></div><!-- 
                 --><div class="inline--v-top question-code pad-l-sm">
                        <pre id="editor" contenteditable="true"></pre>
                    </div><!--
                 --><div class="question-answers mar-t-sm mar-l-sm"></div>
                    <button class="btn btn-secondary btn-next-question js-next-question radius pad-hrz-sm font-light">Next question</button>
                </div>
                <div class="screen leaderboard font-bold">
                    <div class="headline mar-b-sm">Leaderboard</div>
                    <div class="box leaderboard-box inline--v-top">
                        <ol class="pad-hrz-l pad-vrt-l">
                            <li>
                                <div class="score inline--v-middle mar-hrz-md">999</div> Ovidiu Hatmanu
                            </li>
                            <li>
                                <div class="score inline--v-middle mar-hrz-md">998</div> Ovidiu Hatmanu
                            </li>
                            <li>
                                <div class="score inline--v-middle mar-hrz-md">997</div> Ovidiu Hatmanu
                            </li>
                            <li>
                                <div class="score inline--v-middle mar-hrz-md">996</div> Ovidiu Hatmanu
                            </li>
                            <li>
                                <div class="score inline--v-middle mar-hrz-md">996</div> Ovidiu Hatmanu
                            </li>
                            <li>
                                <div class="score inline--v-middle mar-hrz-md">996</div> Ovidiu Hatmanu
                            </li>
                            <li>
                                <div class="score inline--v-middle mar-hrz-md">996</div> Ovidiu Hatmanu
                            </li>
                            <li>
                                <div class="score inline--v-middle mar-hrz-md">996</div> Ovidiu Hatmanu
                            </li>
                            <li>
                                <div class="score inline--v-middle mar-hrz-md">996</div> Ovidiu Hatmanu
                            </li>
                            <li>
                                <div class="score inline--v-middle mar-hrz-md">996</div> Ovidiu Hatmanu
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div><!-- 
     --><div class="loader"></div><!--
 --></div>
    <script src="/web/editor/ace.js"></script>
    <script src="/web/dist/js/app.js"></script>
</body>
</html>