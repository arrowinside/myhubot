# Description:
#   hello
#
# Notes:
#   はろー -> コンニチハ

#getTime time ->
 #console.log "そうですね、もうですしおすし。"
 #console.log gettTime()


getTime = ->
 d = new Date

 hour = d.getHours()
 min = d.getMinutes()

 time = "#{hour}:#{min}" 


nowTime = getTime()
console.log "あいうえお#{nowTime}です"
