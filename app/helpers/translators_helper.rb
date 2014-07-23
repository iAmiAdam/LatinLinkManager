module TranslatorsHelper

	def get_translators_name
		Translator.uniq.pluck(@name)
	end
end
