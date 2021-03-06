/* Search results functions (show and hide full matched contents)
 * Requires: Localization support (i.e. include l10n.*.js script before)
 */

function toggle_contents_on() {
  var tds = document.getElementsByClassName("matching_contents");
  var lnk = document.getElementById("CntntsTglLnk");

  for ( var i = 0; i < tds.length; i++ ) {
    tds[i].style.overflow = "visible";
    tds[i].style.whiteSpace = "normal";
  }

  lnk.href = "javascript:toggle_contents_off()";
  lnk.innerHTML = l10n.SHOWLESS_LNK;
}

function toggle_contents_off() {
  var tds = document.getElementsByClassName("matching_contents");
  var lnk = document.getElementById("CntntsTglLnk");

  for ( var i = 0; i < tds.length; i++ ) {
    tds[i].style = "";
  }

  lnk.href = "javascript:toggle_contents_on()";
  lnk.innerHTML = l10n.SHOWALL_LNK;
}

