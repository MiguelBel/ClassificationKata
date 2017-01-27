require 'rack'
require 'json'

STATUS_CODE = 200
HEADERS = {
  'Content-Type'=>'application/json',
  'Access-Control-Allow-Origin' => '*'
}
BODY = {
  classification: [
    { name: 'Madrid', points: 5 },
    { name: 'Valencia', points: 10 },
    { name: 'Barcelona', points: 7 },
    { name: 'Zaragoza', points: 8 },
    { name: 'Bilbao', points: 9 }
  ]
}.to_json

run lambda { |env| [STATUS_CODE, HEADERS, [BODY]] }
