ImageType = GraphQL::ObjectType.define do
  name 'Image'
  description 'Image of a Product'

  field :url, types.String, 'URL of the Image'
end
