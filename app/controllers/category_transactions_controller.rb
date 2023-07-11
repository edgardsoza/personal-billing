class CategoryTransactionsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @purchase = Purchase.find(params[:id])
    @category_transaction = CategoryTransaction.new(category: @category, purchase: @purchase)

    if @category_transaction.save
      redirect_to category_path(@category), notice: 'Purchase was successfully added to the category.'
    else
      redirect_to category_path(@category), alert: 'Failed to add purchase to the category.'
    end
  end

  def show
    @category = Category.find(params[:id])
    @purchases = @category.purchases
  end
end
