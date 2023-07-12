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
      category_ids.each do |category_id|
        CategoryTransaction.create(category_id:, purchase_id: @purchase.id)
      end
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
    params.require(:purchase).permit(:name, :amount)
  end

  def category_ids
    params.require(:purchase)[:category_ids].reject(&:blank?)
  end
end
