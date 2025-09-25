thing = "abc"
arr = [1,2,3]
arr.each do |thing|
    puts thing
end 
puts thing 
puts "\n\n"

def fabonacci(max)
    i1,i2 = 0,1
    max.times do
        yield i1
        i1, i2 = i1 + i2, i1 
    end
end
fabonacci(10) {|f| print "#{f} -  "}

puts "\n\n"
proc1 =-> arg { puts "In proc1 with #{arg}" }
proc2 =-> arg1, arg2 { puts "In proc2 with #{arg1} and #{arg2}" }
proc3 =->(arg1, arg2) { puts "In proc3 with #{arg1} and #{arg2}" }
proc1.call "ant"
proc2.call "bee", "cat"
proc3.call "dog", "elk"

puts "\n\n"
proc1 = proc {|arg1| puts "In proc1 with #{arg1}"}
proc2 = proc {|arg1,arg2| puts "In proc2 with #{arg1} and #{arg2}"}

proc1.call "ayesha"
proc2.call "ayesha", "khan"
proc2.call "ayesha", "khan", "saam"
proc2.call "saam"

puts "\n\n"
sh = [1,2,3].to_enum
lo = ('a'..'z').to_enum
loop do 
  puts "sh: #{sh.next} - lo: #{lo.next}"
end

puts "\n\n"
loop do 
  puts "lo: #{lo.next} - sh: #{sh.next}"
end

