# frozen_string_literal: true

class WineSerializer < ActiveModel::Serializer
  attributes :id, :producer, :name, :country, :region, :color
end
