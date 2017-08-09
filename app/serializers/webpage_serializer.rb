class WebpageSerializer < ActiveModel::Serializer
  attributes :id, :url, :contents
end
