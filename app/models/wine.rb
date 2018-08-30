# frozen_string_literal: true

class Wine < ApplicationRecord
  belongs_to :user
  validates :producer, :name, :country, :region, :color, presence: true
end
