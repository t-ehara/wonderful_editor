require 'rails_helper'

RSpec.describe "Api::V1::Articles", type: :request do

  describe "GET/api/v1/articles" do
    subject { get(api_v1_articles_path) }
    let!(:article1) { create(:article, updated_at: 1.days.ago) }
    let!(:article2) { create(:article, updated_at: 2.days.ago) }
    let!(:article3) { create(:article, updated_at: 3.days.ago) }

    fit "ユーザーの一覧が取得できる" do
      subject
      res = JSON.parse(response.body)
      binding.pry
      expect(res.length).to eq 3
      expect(res[0].keys).to eq ["id", "title", "updated_at", "user"]
      expect(response).to have_http_status(200)
      expect(res.map { |d| d["id"] }).to eq [article1.id, article2.id, article3.id]
    end
  end

end
