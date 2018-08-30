class RemoveTypeFromWines < ActiveRecord::Migration[5.1]
  def change
    remove_column :wines, :type, :string
  end
end
