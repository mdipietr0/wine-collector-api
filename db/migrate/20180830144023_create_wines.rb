class CreateWines < ActiveRecord::Migration[5.1]
  def change
    create_table :wines do |t|
      t.string :producer
      t.string :name
      t.string :country
      t.string :region
      t.string :color
      t.string :type
    end
  end
end
