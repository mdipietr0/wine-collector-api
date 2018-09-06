class Tasting < ApplicationRecord
  belongs_to :user
  belongs_to :wine
  validates :appearance, :nose, :palate, :conclusions, :user_id, :wine_id,
            presence: true
end
