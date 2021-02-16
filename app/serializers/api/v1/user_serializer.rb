class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :name
  has_many :articles
end
