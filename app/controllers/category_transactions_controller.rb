class CategoryTransactionsController < ApplicationController
    def create
      @category = Category.find(params[:category_id])
      @transaction = Transaction.find(params[:id])
      @category_transaction = CategoryTransaction.new(category: @category, transaction: @transaction)
      
      if @category_transaction.save
        redirect_to category_path(@category), notice: 'Transaction was successfully added to the category.'
      else
        redirect_to category_path(@category), alert: 'Failed to add transaction to the category.'
      end
    end
  
    def show
      @category = Category.find(params[:id])
      @transactions = @category.transactions
    end
  end
  