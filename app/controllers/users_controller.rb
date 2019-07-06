class UsersController < ApplicationController
  before_action :block_access, only:[:new]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = 'Usuário cadastrado com sucesso'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
   @user = User.find(params[:id])
  end

  def update

    if current_user.update(user_params)
      flash[:success] = 'Dados atualizados com sucesso'
      redirect_to user_contacts_url(current_user)
    else
      render 'edit'
    end

  end

  def tables
  end

  private
    def user_params

      params.require(:user).permit(:nome,:email, :password, :password_confirmation)

    end

end
