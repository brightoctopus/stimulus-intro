class Album < ApplicationRecord
  belongs_to :artist

  validates :title, :image_url, presence: true
end
