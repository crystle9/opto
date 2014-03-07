# encoding: UTF-8
FactoryGirl.define do
  factory :book do
    name '夹子'
  end

  factory :post1, class: Post do
    title '星期一'
    content '去干活'
  end
  factory :post2, class: Post do
    title '传奇'
    content '来自星星的你'
  end
  factory :post3, class: Post do
    title '在'
    content '今何在'
  end
                  
end
