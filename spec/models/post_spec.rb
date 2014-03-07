# encoding: UTF-8
require 'spec_helper'
require 'pp'

describe Post do
  it 'fix_index' do
    book = create(:book)
    post1 = create(:post1)
    post2 = create(:post2)
    post3 = create(:post3)
    book.update_index('2,3,1')
    post1.destroy
    expect(book.list_index).to eq(['传奇','在'])    
  end
end
