# Thanks to drifting ruby

require 'net/http'
require 'json'

url = 'http://jsonplaceholder.typicode.com/posts/1'
uri = URI(url)
response = Net::HTTP.get(uri)
standard = JSON.parse(response)
symbol =  JSON.parse(response, symbolize_names: true)
struct = JSON.parse(response, object_class: OpenStruct)

symbol[:name] = 'kobaltz'
struct.name = 'kobaltz'
struct.marshal_dump

require 'httparty'
require 'json'
url = 'http://jsonplaceholder.typicode.com/posts/1'
response = HTTParty.get(url)

standard = JSON.parse(response.to_json)
struct = JSON.parse(response.to_json, object_class: OpenStruct)
symbol =  JSON.parse(response.to_json, symbolize_names: true)
struct.marshal_dump

