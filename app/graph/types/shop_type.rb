ShopType = GraphQL::ObjectType.define do
  name 'Shop'
  description 'A place where things are sold'

  field :name, types.String, 'Name of the Shop'
  field :description, types.String, 'Description of the Shop'
  field :products, types[ProductType], 'Products available in the Shop'
end
