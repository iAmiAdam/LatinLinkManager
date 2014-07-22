class Search < ActiveRecord::Base
	validates :table, presence: true

	def translators
		@translators ||= find_translators
  	end

	private 
		def find_translators
			Translator.find(:all, :conditions => conditions)
		end

		def name_conditions
			["translators.name LIKE ?", "%#{name}"] unless name.blank?
		end


		def rate_conditions
			["translators.rate LIKE ?", "%#{rate}"] unless rate.blank?
		end

		def conditions
			[conditions_clauses.join(' AND '), *conditions_options]
		end

		def conditions_clauses
		  conditions_parts.map { |condition| condition.first }
		end

		def conditions_options
		  conditions_parts.map { |condition| condition[1..-1] }.flatten
		end

		def conditions_parts
		  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
		end
end
