class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups
  validates :name, presence: true, length: { minimum: 1 }
  validates :name, presence: true, length: { minimum: 1 }
  validates :amount, numericality: { greater_than: 0 }
  validates :groups, presence: true
end
