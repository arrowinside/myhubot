# Description:
#   hello
#
# Notes:
#   はろー -> コンニチハ

getTime = ->
 d = new Date
 hour = d.getHours()
 min = d.getMinutes()

 time = "#{hour}:#{min}" 

module.exports = (robot) ->
    robot.hear /ねむい/, (msg) ->
        nowTime = getTime()
        msg.reply "そうですね、もう#{nowTime}ですしおすし。"
