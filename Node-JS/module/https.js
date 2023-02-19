const request = require('');

function request (url, data) {
   send(url, data);
   return read();
}