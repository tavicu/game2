import $ from "jquery";
import {fakeAjax, ajaxHelper} from "./ajax-helper.js";

let $leaderboard = $(".leaderboard-box ol");

let leaderboard = {
    init: () => {
        if ($leaderboard.length) leaderboard.getLeaderboard();
    },

    getLeaderboard: () => {
        ajaxHelper("http://devtalks.emag.ro/index.php?emag/status/").then( (data) => {
        // fakeAjax("getLeaderboard").then( (data) => {
            $leaderboard.html("");
            for (let idx in data) {
                let person = data[idx];
                $leaderboard.append(`<li><div class="score inline--v-middle mar-hrz-md">${person.highscore}</div>${person.name}</li>`);
            }

            setTimeout(leaderboard.getLeaderboard, 30 * 1000);
        });
    }
}

export default leaderboard;