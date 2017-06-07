import $ from "jquery";
import {fakeAjax, ajaxHelper} from "./ajax-helper.js";

let $leaderboard = $(".leaderboard-box ol");

let leaderboard = {
    init: () => {
        if ($leaderboard.length) leaderboard.getLeaderboard();
    },

    getLeaderboard: () => {
        fakeAjax("").then( (data) => {
            data = [
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
            for (let idx in data) {
                let person = data[idx];
                $leaderboard.append(`<li><div class="score inline--v-middle mar-hrz-md">${person.score}</div>${person.name}</li>`);
            }
        });
    }
}

export default leaderboard;