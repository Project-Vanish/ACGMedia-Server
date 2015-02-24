var Express = require('express'),
    app = Express();

var Redis = require('redis'),
    redis = redis.createClient();

var config = require('./config');

var quotation = require('./quotation'),
    quotation_submit = require('./quotation_submit');

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html')
});

app.get('/api/:command', function(req, res){
  quotation(req, res);
});

app.get('/api/submit/:command', function(req, res){
  quotation_submit(req, res);
});

app.listen(config.listen.port, config.listen.host, function(){
  console.log('ACGMedia-Server listening at ' + config.listen.host + ':' + config.listen.port)
});