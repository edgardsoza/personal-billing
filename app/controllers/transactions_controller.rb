class TransactionsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

    def create
      @category = Category.find(params[:category_id])
      @transaction = @category.transactions.new(transaction_params)
      if @transaction.save
        redirect_to category_path(@category), notice: 'Transaction was successfully created.'
      else
        render :new
      end
    end
  
    def show
      @transaction = Transaction.find(params[:id])
    end
  
    private
  
    def transaction_params
      params.require(:transaction).permit(:name, :amount)
    end
  end
  