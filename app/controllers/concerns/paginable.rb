module Paginable
  extend ActiveSupport::Concern

  PER_PAGE = 20

  def paginate(relation)
    relation.page(page).per per_page
  end

  private

    def page
      params[:page]
    end

    def per_page
      PER_PAGE
    end

end
