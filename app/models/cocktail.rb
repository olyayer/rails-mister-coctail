class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses #to be able to do @coctail.engredients

  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader
end
