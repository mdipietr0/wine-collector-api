# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'LWIN.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each_with_index do |row, i|
  w = Wine.new
  w.producer = row[0]
  w.name = row[1]
  w.country = row[2]
  w.region = row[3]
  w.color = row[4]
  # save only every tenth record
  w.save if (i % 10).zero?

  puts "#{w.producer} #{w.name} #{w.country} #{w.region} #{w.color} saved"
end
