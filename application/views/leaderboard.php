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

    <div class="container text-center" data-screen="leaderboard"><!--
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
                <div class="screen leaderboard font-bold">
                    <div class="headline mar-b-sm">Leaderboard</div>
                    <div class="box leaderboard-box inline--v-top">
                        <ol class="pad-hrz-l pad-vrt-l"></ol>
                    </div>
                </div>
            </div>
        </div><!-- 
     --><div class="loader"></div><!--
 --></div>
    <script src="/web/dist/js/app.js"></script>
</body>
</html>