require 'json'

module Response
  TIMEOUT_LIMIT = 10
  STATUS_CODES = {
    ok: 200,
    error: 500
  }
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

  class Normal
    def self.call(env)
      [STATUS_CODES[:ok], HEADERS, [BODY]]
    end
  end

  class Timeout
    def self.call(env)
      random_time = rand(TIMEOUT_LIMIT)
      sleep(random_time)
      [STATUS_CODES[:ok], HEADERS, [BODY]]
    end
  end

  class Failure
    ERROR_BODY = 'SERVER ERROR'
    @@count = 0

    def self.call(env)
      @@count += 1
      random_failure = @@count % 3 == 0
      return [STATUS_CODES[:error], HEADERS, [ERROR_BODY]] if random_failure

      [STATUS_CODES[:ok], HEADERS, [BODY]]
    end
  end
end
