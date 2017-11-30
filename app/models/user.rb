class User < ActiveRecord::Base
	has_many :word_lists, class_name: 'Api::V1::WordList'
  before_create :skip_confirmation!

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  private

  def send_confirmation_email
    self.send_confirmation_instructions
  end
end