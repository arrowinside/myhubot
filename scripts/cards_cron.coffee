# Description:
#   hello
#
# Notes:
#   はろー -> コンニチハ

fs = require 'fs'
readline = require 'readline'
cron = require('cron').CronJob

file = '/opt/npm/myhubot/file/cards_sort.txt'

randomCards = (msg) ->
 arr = []
 hello = ["おはようございます。今日のカード占いの結果はこちらです。","おはようございます。今日はこのカードを使うと勝てる確率が上がります。", "おはようございます。このカードを目に焼き付けて仕事に励みましょう。"]

 rl = readline.createInterface(
     input: fs.createReadStream(file)
     output: null
     terminal: false
 )

 rl.on 'line', (line) ->
   arr.push(line)

 rl.on 'close', ->
   num = Math.floor(Math.random() * arr.length)
   num_h = Math.floor(Math.random() * hello.length)
   msg.send {room: "#let_it_be"}, hello[num_h]
   msg.send {room: "#let_it_be"}, arr[num]


module.exports = (robot) ->
    new cron
       cronTime: '0 30 9 * * *'
       #cronTime: '*/3 * * * * *'
       start: true
       timeZone: "Asia/Tokyo"
       onTick: ->
         randomCards(robot)
