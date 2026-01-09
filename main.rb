#!/usr/bin/env ruby
require 'colorize'

# ==============SCHULTE TABLE=================
def schulte_table
  system("clear") || system("cls")
  puts "Enter the game duration (seconds):"
  game_time = gets.chomp.to_i
  numbers = (1..25).to_a.shuffle
  numbers.each_slice(5) do |row|
    print "|"
    print row.map { |n| n.to_s.rjust(2) }.join("|")
    puts "|"
  end
  sleep(game_time)
  puts "Time's Up!"
end

# =============NUMBER COUNT================
def number_count
  system("clear") || system("cls")
  puts "Enter the game duration (seconds):"
  game_time = gets.chomp.to_i
  target = rand(1..9)
  target_count = 0
  10.times do
    row = []
    10.times do
      number = rand(1..9)
      row << number
      if number == target
        target_count += 1
      end
    end
    puts row.join("|")
  end
  puts "Find how many #{target}'s there are in #{game_time} seconds!"
  start = Time.now
  answer = gets.chomp.to_i
  stop = Time.now
  elapsed_time = (stop - start).to_i

  if (elapsed_time <= game_time) && (answer == target_count)
    puts "You Won!"
  elsif (elapsed_time > game_time) && (answer == target_count)
    puts "Correct but time ran out! Elapsed time: #{elapsed_time}s"
  else
    puts "You Lost! Wrong answer. The correct answer was: #{target_count}"
  end
end

# ===============READ COLOR===================
def read_color
  system("clear") || system("cls")
  colors = [:red, :green, :yellow, :blue, :magenta, :cyan]
  words = ["KIRMIZI", "YEŞİL", "SARI", "MAVİ", "MOR", "TURKUAZ"]
  game = 5
  
  puts "Select Language"
  puts "1-) Turkish"
  puts "2-) English"
  language = gets.chomp.to_i
  
  if language == 2
    words = ["RED", "GREEN", "YELLOW", "BLUE", "MAGENTA", "CYAN"]
  end
  
  game.times do
    system("clear") || system("cls")
    2.times do
      5.times do
        index = rand(words.size)
        word = words[index]
        # Ensure the color is different from the word meaning (Stroop effect)
        available_colors = colors - [colors[index]]
        print word.colorize(available_colors.sample)
        print " "
      end 
      puts ""
    end
    sleep(5)
  end
end

#=============REVERSE NUMBERS=================
def reverse_numbers
  system("clear") || system("cls")
  # Restored to original 10 numbers length
  numbers = (0..9).to_a.shuffle 
  puts "Memorize the numbers:"
  puts numbers.join(" ")
  sleep(5) # Original sleep time
  system("clear") || system("cls")
  puts "Enter the numbers in reverse order (separated by space):"
  answer = gets.chomp.split.map(&:to_i)
  if answer == numbers.reverse
    puts "You Won!"
  else
    puts "You Lost! The correct order was: #{numbers.reverse.join(" ")}"
  end
  sleep(2)
end

#==============FLASH STRINGS=================
def flash_strings
  system("clear") || system("cls")
  words = (0...5).map { ('a'..'z').to_a[rand(26)] }.join
  puts words
  sleep(0.5) 
  system("clear") || system("cls")
  puts "Enter the string you saw:"
  answer = gets.chomp
  if answer == words
    puts "You Won!"
  else
    puts "You Lost! The correct string was: #{words}"
  end
  sleep(2)
end

#================MENTAL CHAIN================
def mental_chain
  current_result = rand(1..10)
  system("clear") || system("cls")
  operations = [:+, :-, :*]
  puts current_result.to_s
  
  5.times do 
    sleep(1.5)
    system("clear") || system("cls")
    number = rand(1..10)
    operation = operations.sample
    puts "#{operation} #{number}"
    current_result = current_result.send(operation, number)
  end
  
  sleep(1.5)
  system("clear") || system("cls")
  puts "What is the result?"
  answer = gets.chomp.to_i
  if answer == current_result
    puts "You Won!"
  else
    puts "You Lost! The correct result was: #{current_result}"
  end
  sleep(2)
end

#================COLOR MATH==================
def color_math
  system("clear") || system("cls")
  colors = [:red, :green, :blue]
  operations = [:+, :-, :*]
  
  colors.shuffle!
  
  colored_operations = {}
  operations.each_with_index do |op, index|
    colored_operations[op] = colors[index]
  end

  puts "Memorize the color-operation pairs:"
  colored_operations.each do |op, color|
    puts "If Color is #{color.to_s.upcase}, operation is: #{op.to_s}".colorize(color)
  end
  
  sleep(6)
  system("clear") || system("cls")
  
  3.times do
    number1 = rand(5..15)
    number2 = rand(1..5)
    
    true_op_pair = colored_operations.to_a.sample 
    true_op_symbol = true_op_pair[0] 
    true_op_color = true_op_pair[1]  
    
    display_symbol = operations.sample 
    
    puts "#{number1} #{display_symbol.to_s.colorize(true_op_color)} #{number2}"
    
    correct_result = number1.send(true_op_symbol, number2)
    
    print "Result > "
    answer = gets.chomp.to_i

    if answer == correct_result
      puts "Correct!".green
    else
      puts "Wrong! The correct result was: #{correct_result}".red
      puts "(Color was #{true_op_color}, so operation was #{true_op_symbol})".yellow
      sleep(3)
      break
    end
    sleep(1)
    system("clear") || system("cls")
  end
  puts "Game Over."
  sleep(2)
end

# ----------------MAIN------------------------

choose = nil
until choose == 0
  system("clear") || system("cls")
  puts "===== Brain Trailer =====".yellow
  puts "1-) Schulte Table".blue
  puts "2-) Number Count".red
  puts "3-) Read Color".green
  puts "4-) Reverse Numbers".magenta
  puts "5-) Flash Strings".cyan
  puts "6-) Mental Chain".light_red
  puts "7-) Color Math".light_green
  puts "0-) Exit".yellow
  print "Select: "

  choose = gets.chomp.to_i

  case choose
  when 1
    schulte_table
  when 2
    number_count
  when 3
    read_color
  when 4
    reverse_numbers
  when 5
    flash_strings
  when 6
    mental_chain
  when 7
    color_math
  when 0
    puts "Exiting..."
  else
    puts "Please make a valid selection!"
    sleep(1)
  end
end