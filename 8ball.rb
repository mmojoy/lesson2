require 'yaml'
require 'colorize'

class Ball
	ANSWERS = YAML.load_file('answers.yml') if File.exist?('answers.yml')
	def shake
		puts 'Enter your question:'
		gets.chomp
		colours = %w(31 32 33 34)
		get_index = rand(ANSWERS.length)
		ball_answer = ANSWERS[get_index]
		puts "\e[#{colours[get_index / 5]}m#{ball_answer}\e[0m"
		ball_answer
	end
end

new_shake = Ball.new
new_shake.shake
