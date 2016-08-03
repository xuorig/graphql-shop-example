Graphql::PersistedDocuments.configure do |config|
  config.schema = ShopSchema
  config.persist_validated_document = lambda do |document|
    uuid = SecureRandom.uuid
    Rails.cache.write(uuid, document)
    uuid
  end
end
