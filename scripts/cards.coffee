# Description:
#   hello
#
# Notes:
#   はろー -> コンニチハ

fs = require 'fs'
readline = require 'readline'

file = '/opt/npm/myhubot/file/cards_sort.txt'

randomCards = (msg) ->
 arr = []

 rl = readline.createInterface(
     input: fs.createReadStream(file)
     output: null
     terminal: false
 )

 rl.on 'line', (line) ->
   arr.push(line)

 rl.on 'close', ->
   num = Math.floor(Math.random() * arr.length)
   #console.log arr[num]
   msg.send arr[num]
   return

module.exports = (robot) ->
    robot.hear /カード占い/, (msg) ->
        randomCards(msg)
