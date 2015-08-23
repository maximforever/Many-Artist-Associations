class Song < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  validates :name, presence: true
  validates :artist, presence: true
end
