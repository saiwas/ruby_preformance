module Logger
  extend self
  attr_accessor :output, :log_actions

  def log(&event)
    self.log_actions ||= []
    self.log_actions << event
  end

  def play
    output = []
    log_actions.each{ |e| e.call(output) }
    puts output.join("\n")
  end
end

class Thing
  def initialize(id)
    Logger.log { |output| output << "create things #{id}"  }
  end
end

puts "Logger1"
1000.times{ |i| Thing.new(i) }
GC.start
Logger.play
puts ObjectSpace.each_object(Thing).count
