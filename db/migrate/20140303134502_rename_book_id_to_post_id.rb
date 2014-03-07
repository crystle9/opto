class RenameBookIdToPostId < ActiveRecord::Migration
  def up
    rename_column :indices, :book_id, :post_id
  end

  def down
    rename_column :indices, :post_id, :book_id
  end
end
