class CreateIndices < ActiveRecord::Migration
  def change
     create_table :indices do |t|
      t.belongs_to :book
      t.belongs_to :patient
      t.integer :lnode
      t.integer :rnode
      t.timestamps
    end
  end
end
