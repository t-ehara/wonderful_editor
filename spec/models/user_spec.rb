require "rails_helper"

RSpec.describe User, type: :model do
  context "同じ名前のuserが存在していない時" do
    let(:user) { build(:user) }
    it "userが作られる" do
      user.save!
      expect(user).to be_valid
    end
  end

  context "同じ名前のuserが存在する時" do
    let(:user) { build(:user, name: "t-ehara") }
    it "user作成に失敗する" do
      user.save!
      user = build(:user, name: "t-ehara")
      expect(user).to be_invalid
    end
  end

  context "nameを指定している時" do
    let(:user) { build(:user, name: "t-ehara") }
    it "ユーザーが作られる" do
      user.save!
      expect(user).to be_valid
    end
  end

  context "nameを指定していない時" do
    let(:user) { build(:user, name: nil) }
    it "user作成に失敗する" do
      user.save
      expect(user).to be_invalid
    end
  end

  context "nameが30文字を超えた時" do
    let(:user) { build(:user, name: "a" * 31) }
    it "ユーザー作成に失敗する" do
      user.save
      expect(user).to be_invalid
    end
  end

  context "同じemailが存在しない時" do
    let(:user) { build(:user, email: "t-ehara@example.com") }
    it "userが作成される" do
      user.save!
      expect(user).to be_valid
    end
  end

  context "同じemailが存在する時" do
    let(:user) { build(:user, email: "t-ehara@example.com") }
    it "user作成に失敗する" do
      user.save!
      user2 = build(:user, email: "t-ehara@example.com")
      expect(user2).to be_invalid
    end
  end

  context "emailが指定されていない時" do
    let(:user) { build(:user, email: nil) }
    it "user作成に失敗する" do
      user.save
      expect(user).to be_invalid
    end
  end

  context "passwordを指定しない時" do
    let(:user) { build(:user, password: nil) }
    it "user作成に失敗する" do
      user.save
      expect(user).to be_invalid
    end
  end
end
