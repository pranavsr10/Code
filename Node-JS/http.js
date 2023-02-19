const http = require('http');
http.request('www.youtube.com', (res) => {
    res.on('sucess',(data) => {
        console.log("Data that we got from the server :" + data); 
    res.on('error',(err) => {
        console.log(err);
    });
});
    
});