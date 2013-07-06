var	amqp = require('amqp');

var express = require('express'),
	app = express(),
	port = parseInt(process.env.PORT, 10) || 8081;

app.configure(function(){
	app.use(express.bodyParser());
	app.use(app.router);
});

app.listen(port);

app.post("/", function(req, res) {
	sendMessage(req.body);
	res.send({ status: 'SUCCESS' });
});

var exchange

function sendMessage(msg)
{
	if(exchange) {  
	  exchange.publish('key.a',msg)
  }
	else {
		console.log("exchange not around now...")
	}
}

var rabbitMQ = amqp.createConnection({ host: '127.0.0.1' });

rabbitMQ.addListener('ready', function(){
	exchange = rabbitMQ.exchange('rabbitExchange',{'type':'fanout'})
});  
