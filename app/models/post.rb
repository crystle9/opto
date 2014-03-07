class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title
  belongs_to :user
  has_many :indices
  has_many :books, :through => :indices

  before_destroy :fix_index

  def fix_index
    self.indices.each do |node|
      node.post_id = nil
      pnode = node
      book = Book.find node.book_id
      # end node
      if node.rnode.nil?
        book.last_page = node.lnode
        node.save
        book.save
        return
      end
      node = Index.find node.rnode
      until node.post_id.nil?
        pnode.post_id = node.post_id
        node.post_id = nil
        pnode.save
        node.save
      end
      book.last_page = pnode.id
      book.save
    end
  end
end
