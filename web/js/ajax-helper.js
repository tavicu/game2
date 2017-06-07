import $ from "jquery";
import loader from "./loader.js";

let fakeAjax = (url) => {
    loader.show();
    return new Promise((resolve) => {
        setTimeout(() => {
            loader.hide();
            resolve(); 
        }, 1000);
    })
};

let ajaxHelper = (url) => {
    loader.show();
    return $.getJSON(url, (data) => {
        loader.hide();
        return data;
    });
};

export {fakeAjax, ajaxHelper};