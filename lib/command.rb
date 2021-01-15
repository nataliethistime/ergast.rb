require 'net/http'
require 'json'

class Command
  def initialize(history)
    @history = Array(history)
  end

  def [](item_name)
    Command.new(Array(@history) + [item_name.to_s])
  end

  def method_missing(method_name)
    Command.new(Array(@history) + [method_name.to_s])
  end

  def to_url
    components = @history
      .filter { |component| !!component }
      .join '/'
    "http://ergast.com/api/#{components}.json"
  end

  def go!
    res = Net::HTTP.get(URI(self.to_url))
    JSON.parse(res)
  end
end
