class Post < ApplicationRecord
  has_rich_text :cotent
  has_one_attached :top_image

  validates :title, length: { maximum: 50 }, presence: true
end
