class Api::V1::WordList < ApplicationRecord
	has_many :word_list_items, class_name: 'Api::V1::WordListItem'
	belongs_to :user
end
