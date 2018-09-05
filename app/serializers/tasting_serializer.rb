class TastingSerializer < ActiveModel::Serializer
  attributes :id, :appearance, :nose, :palate, :conclusions
  has_one :user
  has_one :wine
end
