#!/usr/bin/env ruby
require 'colorize'
# ==============SHULTE TABLE=================
def shulte_table
  puts "Enter the game duration"
  game_time = gets.chomp.to_i
  numbers = (1..25).to_a.shuffle
  numbers.each_slice(5) do |satir|
    print "|"
    print satir.map { |n| n.to_s.rjust(2) }.join("|")
    puts "|"
    
  end
  sleep(game_time)
  puts "Time Finish"
end
# =============NUMBER COUNT================
def number_count
  puts "Enter the game duration"
  game_time = gets.chomp.to_i
  target = rand(1..9)
  target_count = 0
  10.times do
    satir = []
    10.times do
      number = rand(1..9)
      satir << number
      if number == target
        target_count += 1
      end
    end
    puts satir.join("|")

  end
  puts "Find how many #{target}'s there are in #{game_time} seconds!"
  start = Time.now
  answer = gets.chomp.to_i
  stop = Time.now
  time = game_time -(stop - start).to_i

  if (time <= game_time) && (answer == target_count)
    puts "You Won!"
  elsif  (time > game_time) && (answer == target_count)
    puts "Correct but time ran out! Elapsed time: #{time}!"
  else
    puts "You Lost! Wrong answer. Doğru cevap #{target_count}"
  end
end
# ===============READ COLOR===================
def read_color
  colors = [:red, :green, :yellow, :blue, :magenta, :cyan]
  words = ["KIRMIZI", "YEŞİL", "SARI", "MAVİ", "MOR", "MAVİ"]
  game = 5
  puts "Select Language"
  puts "1-) Turkish"
  puts "2-) English"
  language = gets.chomp.to_i
  if language == 2
    words = ["RED", "GREEN", "YELLOW", "BLUE", "MAGENTA", "CYAN"]
  end
  game.times do
    system("clear")
  2.times do
   5.times do
    index = rand(words.size - 1)
    word = words[index]
    color = (colors - [colors[index]])
     print word.colorize(color[rand(color.size - 1)])
     print " "
   end 
   puts ""
  end
  sleep(5)
  end
end
#=============Reverse_Numbers=================
def reverse_numbers
  numbers = (0..9).to_a.shuffle
  puts "Memorize the numbers:"
  puts numbers.join(" ")
  sleep(5)
  system("clear")
  puts "Enter the numbers in reverse order:"
  answer = gets.chomp.split.map(&:to_i)
  if answer == numbers.reverse
    puts "You Won!"
  else
    puts "You Lost! The correct order was: #{numbers.reverse.join(" ")}"
  end
end
#==============Flash_Strings=================
def flash_strings
  words = (0...5).map {('a'..'z').to_a[rand(26)]}.join
  puts words
  sleep(0.5)
  system("clear")
  puts "Enter the string you saw:"
  answer = gets.chomp
  if answer == words
    puts "You Won!"
  else
    puts "You Lost! The correct string was: #{words}"
  end
end
# ----------------MAIN------------------------

choose = nil
until choose == 0
  puts "=====Brain Trailer=====".yellow
  puts "1-) Shulte Table".blue
  puts "2-) Number Count".red
  puts "3-) Read Color".green
  puts "4-) Reverse Numbers".magenta
  puts "5-) Flash Strings".cyan
  puts "0-) Exit".yellow

  choose = gets.chomp.to_i

  case choose
  when 1
    shulte_table
  when 2
    number_count
  when 3
    read_color
  when 4
    reverse_numbers
  when 5
    flash_strings
  when 0
    puts "Exiting..."
  else
    puts "Please make a valid selection!"
  end
end
