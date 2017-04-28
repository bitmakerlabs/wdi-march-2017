// Named function
function namedFunction() {
  console.log("Inside namedFunction");
}

// Functions with parameters
function functionWithParameters(param1, param2) {
  console.log('param1:', param1);
  console.log('param2:', param2);
}

// Anonymous function
var anonymous = function() {
  console.log("I'm anonymous");
};

functionWithParameters(anonymous, null);

function printSomething() {
  console.log("something");
}

window.setTimeout(printSomething, 5000);
