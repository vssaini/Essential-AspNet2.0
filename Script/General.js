/*=======================
TIME SCRIPT
========================*/
var timerID = null;
var timerRunning = false;

function stopclock() {

    if (timerRunning)
        clearTimeout(timerID);
    timerRunning = false;
}

function showtime() {

    var now = new Date();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();
    var timeValue = "" + ((hours > 12) ? hours - 12 : hours);
    if (timeValue == "0") timeValue = 12;
    timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
    timeValue += ((seconds < 10) ? ":0" : ":") + seconds;
    timeValue += (hours >= 12) ? " PM" : " AM";
    var x = document.getElementById("lblTime");
    x.innerHTML = timeValue;

    timerID = setTimeout("showtime()", 1000);
    timerRunning = true;
}

function startclock() {

    stopclock();
    showtime();
}

/*============================================
DEPARTMENT MENU - CHANGE CSS DYNAMICALLY
=============================================*/
function menuClicked() {
    var hf = document.getElementById("hfMenu"); /*alert(hf.value);*/
    document.getElementById(hf.value).className = "rmLinks";
}

/*============================================
CHANGE AUTHOR BACKGROUND COLOR
=============================================*/
function changeAuthorBg() {
    var divF = document.getElementById("divFritz");
    var divK = document.getElementById("divKeith");
    var txC = document.getElementById("txtCheck");

    if (txC.value == "true") {
        divF.className = "fritz bgGreen";
        divK.className = "keith bgYellow";
    }
    else {
        divF.className = "fritz bgYellow";
        divK.className = "keith bgGreen";
    }
}
