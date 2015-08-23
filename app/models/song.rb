class Song < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  validates :name, presence: true, uniqueness: true
  validates :artist, presence: true
end
