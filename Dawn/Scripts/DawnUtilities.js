function Countdown(element) {
    seconds = element.innerHTML;
    if (seconds > 0) {
        element.innerHTML = seconds - 1;
        setTimeout("countdown(element)", 1000);
    }
}

element = document.getElementById("timerLabel");
setTimeout("countdown(element)", 1000);