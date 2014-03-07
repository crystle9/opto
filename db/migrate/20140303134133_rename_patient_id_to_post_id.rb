class RenamePatientIdToPostId < ActiveRecord::Migration
  def up
    rename_column :indices, :patient_id, :book_id
  end

  def down
    rename_column :indices, :book_id, :patient_id
  end
end
