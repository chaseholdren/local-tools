// ==UserScript==
// @name         New Userscript
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://app.mobalytics.gg/tft/team-comps/pony_reroll
// @icon         https://www.google.com/s2/favicons?domain=mobalytics.gg
// @grant        none
// ==/UserScript==

(function () {
  "use strict";

  var refreshIntervalId = setInterval(clearPage, 1000);

  function clearPage() {
    const elements = document.querySelectorAll(".e1gbtzi60, .ehk3y7t1");

    console.log(1);

    if (elements.length === 0) return;

    // clearInterval(refreshIntervalId);

    for (const element of elements) {
      element.remove();
    }
  }

  //   var style = document.createElement('style');
  //    style.innerHTML = `
  //  .e1gbtzi60, .ehk3y7t1 {
  //  display: none;
  //  }
  //  `;
  //    document.head.appendChild(style);
})();
