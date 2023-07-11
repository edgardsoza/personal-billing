class PurchasesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @purchase = Purchase.new
  end

  def create
    @category = Category.find(params[:category_id])
    @purchase = @category.purchases.new(purchase_params)
    @purchase.author = current_user
    if @purchase.save
      redirect_to category_path(@category), notice: 'Purchase was successfully created.'
    else
      puts @purchase.errors.full_messages # Add this line for debugging
      render :new
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount, category_ids: [])
  end
end
