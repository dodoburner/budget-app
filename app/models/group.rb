class Group < ApplicationRecord
  has_one_attached :icon
  has_and_belongs_to_many :purchases
  belongs_to :user
end
