class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all

    respond_with do |format|
      format.html
      format.json { render json: ProductsDatatable.new(@categories) }
    end    
    # ProductsDatatable.new(view_context)
    # respond_with @categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create permitted_params
    render action: "new"
  end

  def edit
    @category = find_category
  end

  def update
    @category = find_category
    @category.update permitted_params
    respond_with @category
  end

  def destroy
    @category = find_category
    @category.destroy
    respond_with @category
  end

  private

    def permitted_params
      params.require(:category).permit :name
    end

    def find_category
      Category.find params[:id]
    end

end
