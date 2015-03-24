# Description:
#   hello
#
# Notes:
#   はろー -> コンニチハ

parser = require 'parse-rss'

getHatebu = (msg) ->
 parser "http://b.hatena.ne.jp/entrylist?sort=hot&threshold=200&mode=rss", (err, res) ->
  arr = []
  if err        
    console.log err
    return
  for value in res
    url = value['link']
    arr.push(url)

  num = Math.floor(Math.random() * arr.length)
  msg.send arr[num]

  return 

module.exports = (robot) ->
    robot.hear /暇つぶし/, (msg) ->
        msg.send "情報取得中…時間がかかるかも"
        getHatebu(msg)
