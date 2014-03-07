# encoding: UTF-8
require "spec_helper"
require "pp"

describe Book do
  it "update_index" do
    book = create(:book)
    post1 = create(:post1)
    post2 = create(:post2)
    post3 = create(:post3)
    book.update_index('2,3')
    expect(book.list_index).to eq(['传奇','在'])
  end
  it "ids_valid?" do
    book = Book.new
    ids = '1,2,1'.split(',')
    expect(book.ids_valid?(ids)).to eq(false)
  end
end
