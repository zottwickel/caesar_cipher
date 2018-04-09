require 'sinatra'

get '/' do 
	def caesar_cipher(string, rot=1)
		output = string.split("")
		output.map! do |x|
			if x.ord.between?("A".ord, "Z".ord)
				x = x.ord + rot <= "Z".ord ? (x.ord + rot).chr : (x.ord + rot - 26).chr
			elsif x.ord.between?("a".ord, "z".ord)
				x = x.ord + rot <= "z".ord ? (x.ord + rot).chr : (x.ord + rot - 26).chr
			else
				x
			end
		end
		output.join("")
	end
	phrase = caesar_cipher(params["phrase"], params["rotations"].to_i) if params["phrase"] != nil
	erb :index, :locals => {:phrase => phrase}
end