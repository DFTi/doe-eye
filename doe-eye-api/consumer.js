var http = require('http'),
	url = require('url'),
	amqp = require('amqp');


var rabbitMQ = amqp.createConnection({ host: '127.0.0.1' });

rabbitMQ.addListener('ready', function(){
	var queue = rabbitMQ.queue('',{'exclusive':true}, function(q){
		q.bind('rabbitExchange','#');
		q.subscribe(function (message) {
			console.log(message);
			console.log("received message");
			console.log(message.data.toString());
		});
	});
});
