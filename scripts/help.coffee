# Description:
#   hello
#
# Notes:
#   はろー -> コンニチハ


module.exports = (robot) ->
    robot.respond /-h||--help/, (msg) ->
        msg.send "説明しよう！"
        msg.send "\"暇つぶし\"…暇つぶし用の記事が表示されます"
        msg.send "\"天気予報\"…千葉県 千葉市の天気予報が表示されます *拡張予定"
        msg.send "\"ねむい\"…ねむいですよね"
