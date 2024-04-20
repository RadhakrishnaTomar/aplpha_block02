class AddDailtsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :contity, :decimal, precision: 5, scale: 2
  end
end
