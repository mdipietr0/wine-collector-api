# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :tastings
  has_many :wines, through: :tastings
end
