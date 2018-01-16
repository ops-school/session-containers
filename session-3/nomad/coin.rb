#!/usr/bin/ruby
require 'socket'
require 'json'
require 'uri'
require 'net/http'
require 'mongo'

def GetUrl(url)
    uri = URI.parse(URI.encode(url.strip))
    http = Net::HTTP.new(uri.host, uri.port)
    http.read_timeout = 5
    request = Net::HTTP::Get.new(uri.request_uri)
    return(http.request(request))
end

hostname = Socket.gethostname
mongosrv = JSON.parse(GetUrl("http://server:8500/v1/catalog/service/global-mongo-check").body)[0]['ServiceAddress']
client = Mongo::Client.new([ mongosrv ], :database => 'coin')
while true
    data = JSON.parse(GetUrl("http://api.coindesk.com/v1/bpi/currentprice.json").body)
    client[:coins].insert_one data
    sleep 10
end
