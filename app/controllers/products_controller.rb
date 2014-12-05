class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action ->{ authorize! message: 'You are not allowed to edit this product.' }, only: [:edit, :update]
  before_action ->{ authorize! message: 'You are not allowed to destroy this product.' }, only: [:destroy]

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product) {|scope| scope.order(id: :desc)}

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def authorize! params
    unless user_signed_in? and (current_user.admin? or product.user == current_user)
      redirect_to category_product_url(category, product),
        flash: { error: params[:message] || 'You are not allowed to perform this action.' }
    end
  end
end
