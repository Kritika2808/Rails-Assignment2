class Detail < ActiveRecord::Base
  belongs_to :user
validates :firstname, presence: true
validates :firstname, format: { with: /\A[a-zA-Z]+\z/,
message: "only alphabets are allowed"}
validates :lastname, presence: true
validates :lastname, format: { with: /\A[a-zA-Z]+\z/,
message: "only alphabets are allowed"}
validates :address, presence: true
validates :contact, presence: true
validates :contact,  numericality: true
 validates :contact, length: { minimum: 10 }
  validates :contact, length: { maximum: 10 }
end
