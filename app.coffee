Express = require 'express'
app = Express()

config = require './config'

quotation = require './quotation'
quotation_submit = require './quotation_submit'

app.get '/', (req, res) ->
  res.sendFile(__dirname + '/index.html')

app.get '/api/:command', (req, res) ->
  quotation req, res

app.get '/api/submit/:command', (req, res) ->
  quotation_submit req, res

app.listen config.listen.port, config.listen.host,  ->
  console.log 'ACGMedia-Server listening at ' + config.listen.host + ':' + config.listen.port