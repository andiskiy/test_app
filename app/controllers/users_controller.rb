# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_new_user, only: %i[new create]

  def index
    respond_to do |format|
      format.html
      format.json do
        users = UsersListQuery.new(User.all, order_params: order_params).call
        scope = UsersSearchQuery.new(users, params[:search]).call
        render json: DataTable::PrepareUsers.new(scope, params).prepare_json.to_json
      end
    end
  end

  def show; end

  def edit; end

  def new; end

  def create
    @user.assign_attributes(user_params)
    if @user.save
      flash[:success] = "Пользователь #{@user.name} успешно создан!"
      redirect_to user_path(@user)
    else
      flash[:danger] = 'Пожалуйста, исправьте ошибки указанные ниже'
      render :new
    end
  end

  def update
    result = Users::Update.call(user: @user, params: user_params)
    if result.success?
      flash[:success] = 'Инофрмация о пользователе обновлена'
      redirect_to user_path(@user)
    else
      flash[:danger] = 'Пожалуйста, исправьте ошибки указанные ниже'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to(users_path)
  end

  private

  def order_params
    DataTableParams.new(params).order_params
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id]).decorate
  end

  def set_new_user
    @user = User.new
  end
end
