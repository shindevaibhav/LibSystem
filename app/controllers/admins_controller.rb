class AdminsController < ApplicationController
  before_action :session_valid

  # GET /admins
  # GET /admins.json
  def index
    puts @admin
    @admin = Admin.find(session[:admin_id])
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin= Admin.find(params[:id])
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
    @admin = Admin.find(session[:admin_id])
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_blank
    delete_if{|k, v| v.empty? or v.instance_of?(Hash) && v.delete_blank.empty?}
  end

  # PATCH/PUT /admin/1
  # PATCH/PUT /admin/1.json
  def update
    @admin = Admin.find(session[:admin_id])
    respond_to do |format|
        if @admin.update(admin_params)
          format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin }
        else
          format.html { render :edit }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      end
    end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin = Admin.find(session[:admin_id])
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_admin_list_path, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admin_list
    @admins=Admin.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def session_valid
      unless admin_logged_in?
        flash[:error] = "Please log in as Admin to view this page"
        redirect_to admin_login_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
end
