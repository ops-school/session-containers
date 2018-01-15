#!/usr/bin/ruby
require 'uri'
require 'net/http'
require 'json'
require 'base64'
require 'redis'

def GetUrl(url)
    uri = URI.parse(URI.encode(url.strip))
    http = Net::HTTP.new(uri.host, uri.port)
    http.read_timeout = 5
    request = Net::HTTP::Get.new(uri.request_uri)
    return(http.request(request))
end

redis = Redis.new(host:"redis", port:6379)
results = JSON.parse(GetUrl("http://consul:8500/v1/kv/?recurse").body)
results.each do |url|
    parsedurl = Base64.decode64(url['Value']) 
    code = GetUrl("http://#{parsedurl}").code
    puts "url return code is: #{code}, now storing in redis"
    redis.set(parsedurl,code)
end
