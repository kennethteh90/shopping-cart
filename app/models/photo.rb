class Photo < ApplicationRecord
  validates :filelocation, presence: true
  belongs_to :product
end
