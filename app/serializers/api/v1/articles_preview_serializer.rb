class Api::V1::ArticlesPreviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :updated_at
  belongs_to :user
end
