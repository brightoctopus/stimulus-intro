class Artist < ApplicationRecord
  validates :name, :image_url, presence: true

  has_many :albums, dependent: :destroy
  has_many :artist_tags, dependent: :destroy 
  has_many :tags, through: :artist_tags

  def formatted_tags
    tags.pluck(:name).map(&:capitalize).to_sentence
  end
end
