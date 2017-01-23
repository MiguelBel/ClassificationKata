require 'rack'
require 'json'
require 'stringio'

response_code = 200
headers = {
  'Content-Type'=>'application/json',
  'Access-Control-Allow-Origin' => '*'
}
classification = { classification: [
    { name: "Madrid", points: 5 },
    { name: "Valencia", points: 10 },
    { name: "Barcelona", points: 7 },
    { name: "Zaragoza", points: 8 },
    { name: "Bilbao", points: 9 }
  ]
}

run lambda { |env| [response_code, headers, StringIO.new(classification.to_json)] }