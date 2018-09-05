class AddNoseToTastings < ActiveRecord::Migration[5.1]
  def change
    add_column :tastings, :nose, :string
  end
end
