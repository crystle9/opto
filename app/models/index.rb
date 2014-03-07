class Index < ActiveRecord::Base
  attr_accessible :lnode, :rnode, :book_id, :post_id
  belongs_to :book
  belongs_to :post

end
