class DebtsController < ApplicationController

  def index
    @debts = current_user.debts
  end

  def new
    @debt = Debt.new
  end

  def create
    @debt = current_user.debts.build(debt_params)
    if @debt.save
      flash[:success] = 'Pagamento criado com sucesso.'
      redirect_to user_debts_path
    else
      render 'new'
    end
  end

  def edit
    @debt = current_user.debts.find_by(id: params[:id])
    if @debt.nil?
      flash[:danger] = 'Pagamento não encontrado.'
      redirect_to user_debts_path(current_user)
    end
  end

  def update
    @debt = current_user.debts.find(params[:id])
    if @debt.update(debt_params)
      flash[:success] = 'Pagamento atualizado com sucesso'
      redirect_to user_debts_path
    else
      render 'edit'
    end
  end

  def destroy
    @debt = current_user.debts.find(params[:id])
    if @debt.destroy
      flash[:success] = 'Pagamento removido com sucesso'
      redirect_to user_debts_path
    else
      flash[:danger] = 'Pagamento não encontrado.'
      redirect_to user_debts_path(current_user)
    end
  end

  private
  def debt_params
    params.require(:debt).permit(:name, :price, :description, :payday)
  end

end
