#!/usr/bin/ruby
require 'uri'
require 'net/http'

def PutEntries(url,value)
    uri = URI.parse(url)
    request = Net::HTTP::Put.new(uri.path)
    request["Content-Type"] = "plain/text"
    request.body = value
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(request)
end

count = 0
[ "www.goole.com","www.yahoo.com","www.facebook.com" ].each do |url|
    count += 1
    PutEntries("http://consul:8500/v1/kv/key#{count}",url)
end
