class AddUserToWines < ActiveRecord::Migration[5.1]
  def change
    add_reference :wines, :user, foreign_key: true
  end
end
