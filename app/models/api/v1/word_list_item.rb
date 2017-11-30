class Api::V1::WordListItem < ApplicationRecord
	belongs_to :word_list, class_name: Api::V1::WordList
end
