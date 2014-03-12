Feature: 将文档整理成册
    点"New Book"，我新建了一本书。
      我只有登录后才能新建、删除自己的书，
      但可以匿名浏览。
    显然这本书是空的，点击"Edit"。
      我看到了我所有的文档名，
      我把需要的用#隔开，写在目录栏上，
      保存，成功后跳转到书的第一页，否则提示错误信息。
    打开一本书，我看到书的第一页，在右上角显示书名。
    页脚有导航条，我可以打开书的前一页，如果有的话，当然下一页也是这样。
      我还可以直接到第一页，和最后一页。
    我看完了，或不想看了，合上，我又回到了主页。
 
    Scenario: 新建一本书、并浏览
        Given I have signed in
        And I click "New Book"
        And I fill in "Name" with "唐诗三百首"
	And I fill in "Description" with "三百首唐诗背死你"
        When I press "Create Book"
        Then page should have notice message "Your book was successfully created."
        Given I have 3 posts
        And I am on the book edit page
        When I click "Edit Index"
        And I fill in "Index" with "2,1,3"
        When I press "Update Index"
        Then page should have notice message "Your index was successfully updated."
        And I am on the index page
        And I click "传奇"
        And I click "Next"
        And I click "Next"
        And I click "Prev"
        Then page should have title "在"

	When I visit "/books"
	And I click "Show"
	Then page should have content "三百首唐诗背死你"