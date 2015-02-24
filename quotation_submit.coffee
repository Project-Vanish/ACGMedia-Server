md5 = require 'MD5'
async = require 'async'

Redis = require 'redis'
redis = Redis.createClient()

redis.on "error", (err) -> console.log("Redis Error: " + err);

Quotation = (text, categoryID, fromID) ->
  this.text = text
  this.categoryID = categoryID
  this.fromID = fromID

addFrom = (name, Callback) ->
  md5Name = md5(name)
  async.waterfall [
    (callback) -> 
      redis.hget 'quotation:from', md5Name, (err, reply) ->
        if !reply then callback null, reply
        else callback 'Existen from!'
    (reply, callback) ->
      redis.hlen 'quotation:from', (err, fCount) ->
        if !err
          fid = fCount + 1
          redis.hset 'quotation:from', md5Name, fid
          redis.set 'quotation:from:' + fid + ':name', name
          callback null, {isok: 1, from_id: fid, from_md5: md5Name}
        else callback err
  ], (err, result) ->
    if !err then Callback result
    else Callback {err: err}


addCategory = (name) ->


addQuotations = (text, categoryID, fromID) ->


module.exports = (req, res) ->
  switch req.params.command
    when 'addFrom' then addFrom req.query.name, (result) -> res.send result
    when 'addCategory' then addCategory req.query.name, (result) -> res.send result
    when 'addQuotations' then res.send 'addQuotations'