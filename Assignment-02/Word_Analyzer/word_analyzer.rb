# method that counts the number of vowels in multiple words. practice Strings and splat parameters

def count_vowels(*words)
  vowels = %w[a e i o u]
  words.each do |word|
    count = word.downcase.chars.count { |ch| vowels.include?(ch) }
    puts "#{word}: #{count} vowels"
  end
end

count_vowels("Ruby", "Programming", "AyeshaKhan")
