class Book < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, length: { maximum: 255 }
end
