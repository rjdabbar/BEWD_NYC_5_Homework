require 'json'
require 'rest-client'
require 'launchy'
require_relative 'movie'

puts "What movie would you like to look up?"
title = gets.chomp

  while title.strip.empty?
    puts "What movie would you like to look up?"
    title = gets.chomp
  end

movie = Movie.new(JSON.parse RestClient.get("http://www.omdbapi.com/", {params: {t: title, tomatoes: true}}))

puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Synopsis: #{movie.plot} "
puts "#{movie.title} came out in #{movie.year}"
puts "#{movie.check_genres}"
puts ""
puts "Starring: #{movie.actors}"
puts "Written by: #{movie.writer}"
puts "Produced by: #{movie.producers}"
puts "Directed by: #{movie.director}"
puts ""
puts "#{movie.check_rating}"
puts "#{movie.is_it_suitable_for_kids}"
puts ""
puts "#{movie.compare_rt_scores}"
puts "#{movie.fresh?}"
puts ""
puts "Critics say: #{movie.tomato_consensus}"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Would you like to see their website in your default browser? (y/n)"

input = gets.chomp

  if input =~ /y/
    movie.go_to_website
  else
    puts "OK!"
  end






