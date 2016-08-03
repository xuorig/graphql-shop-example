Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
    mount Graphql::PersistedDocuments::Engine, at: '/graphql/persist'
  end

  post '/graphql' => 'graphql#execute'
end
