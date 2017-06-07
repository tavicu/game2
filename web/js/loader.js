import $ from "jquery";
let $container = $(".container");

let loader = {
    show: () => $container.addClass("loading"),
    hide: () => $container.removeClass("loading")
};

export default loader;