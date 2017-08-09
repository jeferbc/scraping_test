class ContentSerializer < ActiveModel::Serializer
  attributes :id, :tag, :content, :created_at
end
