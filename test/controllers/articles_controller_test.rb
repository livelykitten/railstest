require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end
  teardown do
    Rails.cache.clear
  end
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get articles_url
    assert_response :success
  end
  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: { article: { body: 'Rails is awe...sdsdsdsdsdsdsdsdsdsdsdsdsd', title: 'Hello', status: "public"}}
      assert_response :redirect
    end

    assert_redirected_to article_path(Article.last)
  end
  test "should show article" do
    get article_url(@article)
    assert_response :success
  end
  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end
    assert_redirected_to "/"
  end
  test "should update article" do
    patch article_url(@article), params: {article: {title: "updatedss", body: "@article.body", status: "public"}}
    assert_redirected_to article_path(@article)

    @article.reload
    assert_equal "updated", @article.title
  end 
end
