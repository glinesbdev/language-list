class Api::V1::WordListItem < ApplicationRecord
	belongs_to :word_list, class_name: 'Api::V1::WordList'
	include Rails.application.routes.url_helpers

	def to_builder
		Jbuilder.new do |item|
			item.(self, :word, :translation, :context, :created_at, :updated_at)
			item.word_list_url word_list_path(id: self.word_list_id)
		end
	end
end
