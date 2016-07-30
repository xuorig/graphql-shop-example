class GraphqlController < ApplicationController
  def execute
    query_string = params[:query]
    document_id = params[:document_id]
    variables = ensure_hash(params[:variables])

    raise StandardError unless query_string || document_id

    if query_string
      result = execute_from_query_string(query_string, variables)
    else
      result = execute_from_persisted_document(document_id, variables)
    end

    render json: result
  end

  private

  def execute_from_query_string(query_string, variables)
    ShopSchema.execute(query_string, variables: variables)
  end

  def execute_from_persisted_document(document_id, variables)
    persisted_document = get_persisted_document(document_id)
    ShopSchema.execute(document: persisted_document, variables: variables)
  end

  def get_persisted_document(document_id)
    Rails.cache.fetch(document_id)
  end

  def ensure_hash(query_variables)
    if query_variables.blank?
      {}
    elsif query_variables.is_a?(String)
      JSON.parse(query_variables)
    else
      query_variables
    end
  end
end
