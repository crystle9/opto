class AddBookIdToIndices < ActiveRecord::Migration
  def change
    add_column :indices, :book_id, :integer
  end
end
