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

// var refreshIntervalId = setInterval(clearPage, 1000);

// function clearPage() {
//   const elements = document.querySelectorAll(".e1gbtzi60, .ehk3y7t1");

//   console.log(1);

//   if (elements.length === 0) return;

//   // clearInterval(refreshIntervalId);

//   for (const element of elements) {
//     element.remove();
//   }
// }

addCssScript(`
  .css-q70a0o img {
  }
  .ehk3y7t1 {
    display: none;
  }
  .e1gbtzi60 {
    display: none;
  }
  .css-8ezmd7.enl0bsh10 {
      display: flex;
      flex-direction: column;
  }
`);

function addCssScript(cssString) {
  var style = document.createElement("style");
  style.innerHTML = cssString;
  document.head.appendChild(style);
}

function moveLevelingGuide() {
  const levelingGuideElement =
    document.querySelectorAll(".enl0bsh10")[0].children[1];

  levelingGuideElement.style.order = 4;
}
setInterval(moveLevelingGuide, 1000);
