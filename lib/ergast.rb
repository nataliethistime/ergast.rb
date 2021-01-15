require_relative 'call'
require_relative 'command'

class Ergast
  def self.f1
    Command.new(['f1'])
  end
end
