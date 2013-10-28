class Book < ActiveRecord::Base
 has_many :requests
 belongs_to :user
 validates :book_title, presence: true
 validates :author_name, presence: true
 validates :no_of_pages, presence: true
end
