/* Timer */
const delay = (param1,param2) => {
    console.log(param1 + " Delayed ");
}
setTimeout(delay, 1000 ,'Hello World');
const timerId = setInterval(function() {console.log("Interval");},100000);
clearInterval(timerId);

/* Set Immediate */
setImmediate(function() {console.log("Immediate");});
console.log("test");
