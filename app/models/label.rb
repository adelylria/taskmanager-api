class Label < ApplicationRecord
  has_many :card_labels
  has_many :cards, through: :card_labels

  validates :name, presence: true
  validates :color, presence: true
end
