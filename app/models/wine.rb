# frozen_string_literal: true

class Wine < ApplicationRecord
  has_many :tastings
  validates :producer, :name, :country, :region, :color, presence: true
end
