class Book < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :posts, :through => :indices
  has_many :indices, :dependent => :destroy
  belongs_to :user
  
  after_create :create_blank_index

  # if idstring changed, update
  #   or do nothing!
  def update_index(idstring)
    clean_index
    index_append_many(idstring)
    self.save
  end
  
  # output: [<# post1>,...]
  def list_index
    node = Index.find self.page_one
    posts = []
    until node.rnode.nil?
      node = Index.find node.rnode
      id = node.post_id
      unless id.nil?
        post = Post.find(id)
        posts.push(post.nil? ? nil : post)
      end
      break if node.id >= self.last_page
    end
    posts
  end
  
  def ids_valid?(ids)
    array = []
    ids.each do |str|
      id = str.to_i
      (id.nil? || id <= 0) and return false
      array[id].nil? or return false
      array[id] = 1
    end
    return true
  end

  protected 

  def index_append_many(idstring)
    # many times index_append_to
    #   and find next node.
    ids = idstring.split(',')
    ids_valid?(ids) or return 'invalid_ids'
    pnode_id = self.last_page
    pnode = Index.find pnode_id
    ids.each do |id|
      node_id = index_append_to(pnode,id)
      if node_id.nil?
        self.last_page = pnode_id
        return 'bad_node_id'
      else
        pnode.rnode = node_id
        pnode.save
        pnode_id = node_id
        pnode = Index.find node_id
      end
    end
    self.last_page = pnode_id
  end

  def index_append_to(node,post_id)
    return 'post_not_exists' unless post_exist?(post_id)
    return 'invalid_node'  if node.nil?

    # if node.rnode exist, use it
    #   or create a node!
    if node.rnode.nil?
      new_node = indices.create
      new_node.lnode = node.id
    else
      new_node = Index.find node.rnode
      if new_node.nil?
        return 'cannot find the node'
      end
    end
    new_node.post_id = post_id
    new_node.save
    new_node.id
  end


  def create_blank_index
    self.page_one = indices.create.id
    self.last_page = self.page_one
    self.save
  end

  def clean_index
    self.last_page = self.page_one
    indices.each do |node|
      node.post_id = nil
    end
  end

  def post_exist?(post_id)
    (post_id.nil? || Post.find(post_id).nil?) ? false : true
  end

end

