class Tasting < ApplicationRecord
  belongs_to :user
  belongs_to :wine
  validates :appearance, :nose, :palate, :conclusions, presence: true
end
