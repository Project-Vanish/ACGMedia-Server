Redis = require 'redis'
redis = Redis.createClient()

qid2sq = (qid, callback) ->
  redis.get 'quotation:' + qid , (err, reply) ->
    if !err
      callback null, reply
    else
      callback err


cid2qid = (cid) ->

fid2qid = (fid) ->

qt2qid = (qid) ->

cid2ct = (cid) ->

fid2ft = (fid) ->

ct2cid = (categoryText) ->

ft2fid = (fromText) ->

getSingleQuotation = (dataType, qid, categoryID, fromID) ->

getQuotations = (dataType, categoryID, fromID) ->

module.exports = (req, res) ->