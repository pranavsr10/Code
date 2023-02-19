function encrypt(data) {
   return  'encrypted data' ;
}

function send(url, data)  {
  const encrypteddata = encrypt(data);
  console.log(`sending ${encrypteddata} to ${url}`);
}

module.exports = {
  encrypt: encrypt,
  send: send,
};