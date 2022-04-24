class Post < ApplicationRecord
  has_rich_text :cotent
  has_one_attached :top_image

  validates :title, length: { maximum: 50 }, presence: true
  validates :image, 
    content_type: [:png, :jpg, :jpeg], 
    size: { less_than_or_equal_to: 10.megabytes }, 
    dimension: { width: { max: 2000 }, height: { max: 2000 }}
  
end
