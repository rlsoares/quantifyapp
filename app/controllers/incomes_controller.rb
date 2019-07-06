class IncomesController < ApplicationController

  def index
    @incomes = current_user.incomes
  end

  def new
    @income = Income.new
  end

  def create
    @income = current_user.incomes.build(income_params)
    if @income.save
      flash[:success] = 'Receita inserida com sucesso.'
      redirect_to user_incomes_path
    else
      render 'new'
    end
  end

  def edit
    @income = current_user.incomes.find_by(id: params[:id])
    if @income.nil?
      flash[:danger] = 'Receita não encontrada.'
      redirect_to user_incomes_path(current_user)
    end
  end

  def update
    @income = current_user.incomes.find(params[:id])
    if @income.update(income_params)
      flash[:success] = 'Receita atualizada com sucesso'
      redirect_to user_incomes_path
    else
      render 'edit'
    end
  end

  def destroy
    @income = current_user.incomes.find(params[:id])
    if @income.destroy
      flash[:success] = 'Receita removida com sucesso'
      redirect_to user_incomes_path
    else
      flash[:danger] = 'Receita não encontrada.'
      redirect_to user_incomes_path(current_user)
    end
  end

  private
  def income_params
    params.require(:income).permit(:name, :value, :date)
  end
end
