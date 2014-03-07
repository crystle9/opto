class AddLastPageToBooks < ActiveRecord::Migration
  def change
    add_column :books, :last_page, :integer
  end
end
