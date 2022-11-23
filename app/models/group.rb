class Group < ApplicationRecord
  has_one_attached :icon
  has_and_belongs_to_many :purchases
  belongs_to :user
  validates :name, presence: true, length: { minimum: 1 }
  validates :icon, presence: true
end
