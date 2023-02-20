const request = require('./request.js');
const response = require('./response.js');

function something(url, data) {
    request.send(url, data);
    return response.read();
}

const responsedata =something('https://google.com','hello');
console.log(responsedata);