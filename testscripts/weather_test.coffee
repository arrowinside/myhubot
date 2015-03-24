# Description:
#   千葉県の2日分の天気予報を表示
#
# Notes:
#   "天気予報"と発言する

parser = require 'json-parser'
request = require 'request'
#require = require 'require'

getForecast = ->
 
 request('http://weather.livedoor.com/forecast/webservice/json/v1?city=120010', (err, response, body) ->
  throw err if err  # 接続エラーなどが発生した場合
  if response.statusCode is 200  # ステータスコードが「OK」の場合
    #result = parser.parse(body)
    result = JSON.parse(body)

    console.log result
    pref = result['title']
    comment = result['description']['text']

    for key,val of result['forecasts']
      if val['dateLabel'] is '今日'
       today = "今日 : #{val['telop']}"
       today_temp_min = val['temperature']['min']['celsius']
       today_temp_max = val['temperature']['max']['celsius']
      if val['dateLabel'] is '明日'
       tommorow = "明日 : #{val['telop']}"
       tommorow_temp_min = val['temperature']['min']
       tommorow_temp_max = val['temperature']['max']
       temp = val['temperature']

    #console.log "#{forecastSummaly['pref']}"
   
    #forecastSummaly = { pref:"#{pref}", comment:"#{comment}" }
    console.log today_temp_min   
    console.log today_temp_max   
 
    console.log tommorow_temp_min   
    console.log tommorow_temp_max
    console.log temp
   
  else
    console.log "response error: #{response.statusCode}"
 
 )
 #console.log "a#{pref}a"
 #return forecastSummlay = { pref:"#{window.pref}", comment:"#{window.comment}" }
 #console.log forecastSummaly   
 forecastSummaly2 = { pref:"aa", comment:"bb" }
 #forecastSummaly2 = { pref:"#{window.forecastSummaly['pref']}", comment:"bb" }
 

forecast = getForecast()
#console.log "#{forecast['pref']}"
