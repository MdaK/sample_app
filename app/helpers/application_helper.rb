module ApplicationHelper

	def title

		base_title = 'MonApplication'

		if @titre.nil?
			base_title
		else
			"#{base_title} | #{@titre}"
		end
	end

	def logo
		image_tag("logo.png", :alt => "Application Exemple", :class => "round")
	end
end

