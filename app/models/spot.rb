class Spot < ApplicationRecord
  has_many :reviews, as: :reviewable
end
