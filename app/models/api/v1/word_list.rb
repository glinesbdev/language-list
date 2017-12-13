class Api::V1::WordList < ApplicationRecord
	has_many :word_list_items, class_name: 'Api::V1::WordListItem'
	belongs_to :user

	def to_builder
		Jbuilder.new do |list|
			list.(self, :id, :name, :language, :created_at, :updated_at)

			if self.word_list_items.any?
				list.items self.word_list_items do |item|
					list.item item.to_builder
				end
			end

			list.user user.to_builder
		end
	end
end
