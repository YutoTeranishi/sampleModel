class Person < ApplicationRecord
  has_many :message

  validates :name, presence: { message:'は、必須項目です。'}
  validates :age, numericality: { message:'数字で入力ください。'}
  validates :mail, email: { message:'はメールアドレスではありません。'}
end
