QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description "The query root for this schema"

  field :shop do
    type -> { ShopType }
    description 'A place where things are sold.'

    argument :id, types.Int, "Unique ID of the shop"

    resolve -> (_, args, _) do
      Shop.find(args['id'])
    end
  end
end
