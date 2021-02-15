# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  image                  :string
#  name                   :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
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
      expect(user).to be_invalid
    end
  end

  context "nameが30文字を超えた時" do
    let(:user) { build(:user, name: "a" * 31) }
    it "ユーザー作成に失敗する" do
      expect(user).to be_invalid
    end
  end

  context "同じemailが存在しない時" do
    let(:user) { build(:user, email: "t-ehara@example.com") }
    it "userが作成される" do
      expect(user).to be_valid
    end
  end

  context "同じemailが存在する時" do
    let(:user) { build(:user, email: "t-ehara@example.com") }
    it "user作成に失敗する" do
      user.save!
      user = build(:user, email: "t-ehara@example.com")
      expect(user).to be_invalid
    end
  end

  context "emailが指定されていない時" do
    let(:user) { build(:user, email: nil) }
    it "user作成に失敗する" do
      expect(user).to be_invalid
    end
  end

  context "passwordを指定しない時" do
    let(:user) { build(:user, password: nil) }
    it "user作成に失敗する" do
      expect(user).to be_invalid
    end
  end
end
