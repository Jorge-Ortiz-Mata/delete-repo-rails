require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[name]"

      assert_select "textarea[name=?]", "article[description]"
    end
  end
end
