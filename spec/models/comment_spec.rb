# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Comment, type: :model do
  context "commentが存在する時" do
    let!(:comment) { build(:comment) }
    it "commentが作成される" do
      expect(comment).to be_valid
    end
  end

  context "commentが存在しない時" do
    let!(:comment) { build(:comment, body: nil) }
    it "commentが作成されない" do
      expect(comment).to be_invalid
    end
  end

  context "commentが50文字を超えた時" do
    let!(:comment) { build(:comment, body: Faker::Alphanumeric.alpha(number: 51)) }
    it "commentが作成されない" do
      expect(comment).to be_invalid
    end
  end
end
