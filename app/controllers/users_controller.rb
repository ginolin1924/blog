class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_competence, only: [:index, :new, :create, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # GET /edit_own_password
  def edit_own_password
    @user = current_user
  end
  
  # PUT /edit_own_password
  def update_own_password
    @user = current_user
    respond_to do |format|
      if current_user.try(:authenticate, params['old_password'])
        if @user.update(params.require(:user).permit(:password, :password_confirmation))
          format.html { redirect_to edit_own_password_path, notice: '密碼已更新' }
        else
          format.html { redirect_to edit_own_password_path, notice: 'Password confirmation fails' }
        end
      else
        format.html { redirect_to edit_own_password_path, notice: 'Wrong Password' }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :role, :level, :title, :password, :password_confirmation)
    end
    
    def check_competence
      if (!is_teacher?)
        redirect_to root_path
      end
    end
end
