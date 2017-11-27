module Logger
  extend self
  attr_accessor :output

  def log(&event)
    self.output ||= []
    event.call(output)
  end

  def play
    puts output.join("\n")
  end
end

class Thing
  def initialize(id)
    Logger.log { |output| output << "create things #{id}"  }
  end
end

puts "Logger2"
1000.times{ |i| Thing.new(i) }
GC.start
Logger.play
puts ObjectSpace.each_object(Thing).count
