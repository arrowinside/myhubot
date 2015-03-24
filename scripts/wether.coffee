# Description:
#   "天気予報"と発言すると千葉県の2日分の天気予報を表示

parser = require 'json-parser'
request = require 'request'

getForecast = (msg) ->
 request('http://weather.livedoor.com/forecast/webservice/json/v1?city=120010', (err, response, body) ->
  throw err if err  # 接続エラーなどが発生した場合
  if response.statusCode is 200  # ステータスコードが「OK」の場合
    result = parser.parse(body)

    #console.log result
    pref = result['title']
    comment = result['description']['text']

    for key,val of result['forecasts']
      if val['dateLabel'] is '今日'
       today = val['telop']
       #today_temp_min = val['temperature']['min']['celsius']
       #today_temp_max = val['temperature']['max']['celsius']
      if val['dateLabel'] is '明日'
       tommorow = val['telop']
       #tommorow_temp_min = val['temperature']['min']['celsius']
       #tommorow_temp_max = val['temperature']['max']['celsius']

    msg.send pref
    #msg.send "今日：#{today} 最高気温：#{today_temp_max}度 最低気温：#{today_temp_min}度" 
    msg.send "今日：#{today}" 
    #msg.send "明日：#{tommorow} 最高気温：#{tommorow_temp_max} 最低気温：#{tommorow_temp_min}"
    msg.send "明日：#{tommorow}"
    msg.send "-------------------------"
    msg.send comment

    return
 
  else
    console.log "response error: #{response.statusCode}"
    return 

 )

module.exports = (robot) ->
     robot.hear /天気予報/, (msg) ->
         getForecast(msg)
