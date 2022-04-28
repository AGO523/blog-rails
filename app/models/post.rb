class Post < ApplicationRecord
  searchkick language: "japanese"
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  belongs_to :user
  
  has_rich_text :cotent
  has_one_attached :top_image
  acts_as_taggable_on :tags

  validates :title, length: { maximum: 50 }, presence: true
  validates :top_image, 
    content_type: [:png, :jpg, :jpeg], 
    size: { less_than_or_equal_to: 10.megabytes }, 
    dimension: { width: { max: 2000 }, height: { max: 2000 }}
  
  def seach_data
  {
    title: title,
    tag_name: tag_name,
    content: content
  }
  end
end
