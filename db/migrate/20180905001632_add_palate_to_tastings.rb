class AddPalateToTastings < ActiveRecord::Migration[5.1]
  def change
    add_column :tastings, :palate, :string
  end
end
