class AddPageOneToBooks < ActiveRecord::Migration
  def change
    add_column :books, :page_one, :integer
  end
end
