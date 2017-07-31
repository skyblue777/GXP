module Searchable
  extend ActiveSupport::Concern

  def search(relation, *fields)
    if query.present?
      params = Hash[fields.map { |field| [ field, query ] }]
      relation.basic_search params, false
    else
      relation
    end
  end

  private

    def query
      params[:query]
    end

end
