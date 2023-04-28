require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article_valid) { Article.new(name: 'First article', description: 'Some description') }
  let(:article_invalid) { Article.new }

  describe('article instances') do
    it('it should be valid') do
      expect(article_valid).to be_valid
    end

    it('it should not be valid') do
      expect(article_invalid).to_not be_valid
    end
  end
end
