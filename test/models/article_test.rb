require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "save with title" do
    article = Article.new
    assert article.save
  end
end
