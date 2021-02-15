# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Article, type: :model do
  context "titleが指定されている時" do
    let!(:article) { build(:article, title: "yyy") }
    it "articleが作成される" do
      expect(article).to be_valid
    end
  end

  context "titleが指定されていない時" do
    let!(:article) { build(:article, title: nil) }
    it "articleの作成に失敗する" do
      expect(article).to be_invalid
    end
  end

  context "titleが30文字以上の時" do
    let!(:article) { build(:article, title: Faker::Alphanumeric.alpha(number: 31)) }
    it "articleの作成に失敗する" do
      expect(article).to be_invalid
    end
  end
end
