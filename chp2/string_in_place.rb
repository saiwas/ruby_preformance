require '../wrapper'

str = "x" * 1024 * 1024

puts "downcase"
measure do
  str = str.downcase
end

puts "======================"
puts "downcase!"
measure do
  str.downcase!
end
