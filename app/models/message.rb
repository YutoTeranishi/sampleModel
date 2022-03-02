class Message < ApplicationRecord
  validates :message, presence: { message:'を書いてください'}
end
