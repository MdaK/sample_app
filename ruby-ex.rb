#!/usr/bin/env ruby

# EX1

a = "rubyonrails"
a = a.split('').shuffle.join
puts a

# EX2

class String
	def shuffle
		self.split('').shuffle
	end
end

# EX3

puts "foobar".shuffle

personne1 = {}
personne2 = {}
personne3 = {}

personne1 = { :prenom => "Yira",:nom => "Mira" }
personne2 = { :prenom => "Jira",:nom => "Mira" }
personne3 = { :prenom => "Tarya",:nom => "Mira"}

famille = {}
famille = { :pere => personne1, :mere => personne2, :enfant => personne3 }

puts personne1
puts personne2
puts personne3

puts famille

d1 = { "a" => 100, "b" => 150 }
d2 = { "c" => 125, "d" => 175}
puts d1.merge(d2)
# Fusionne deux tableaux de hash

