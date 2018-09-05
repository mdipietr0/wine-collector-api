class AddAppearanceToTastings < ActiveRecord::Migration[5.1]
  def change
    add_column :tastings, :appearance, :string
  end
end
