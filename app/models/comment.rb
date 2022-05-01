class Comment < ApplicationRecord
  belongs_to :post

  validates :name, length: { maximum: 30 }, presence: true
  validates :content, length: { maximum: 500 }, presence: true
end
