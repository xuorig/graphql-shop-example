ProductType = GraphQL::ObjectType.define do
  name 'Product'
  description 'A product sold in a Shop'

  field :name, types.String, 'Name of the Product'
  field :description, types.String, 'Description of the Product'
  field :image, ImageType, 'Image of the Product'
end
