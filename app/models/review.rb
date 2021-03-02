class Review < ApplicationRecord
  validates :rating, :comment, presence: true
end
