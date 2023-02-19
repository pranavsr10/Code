const EventEmitter = require('events');
const Celebrity = new EventEmitter();
// Listener one
Celebrity.on('wins',function() {
    console.log('celebrity wins');
});

// Another listener
Celebrity.on('wins', function() {
    console.log('celebrity wins from listener 2');    
});

// Listener two
Celebrity.on('loses',function() {
    console.log('celebrity loses');
});

//emitter function
Celebrity.emit('wins');
Celebrity.emit('loses');
