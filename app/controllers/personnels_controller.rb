class PersonnelsController < ApplicationController
  before_action :set_personnel, only: [:show, :edit, :update, :destroy]

  # GET /personnels
  # GET /personnels.json
  def index
    @personnels = User.all
  end

  # GET /personnels/1
  # GET /personnels/1.json
  def show
  end

  # GET /personnels/new
  def new
    @personnel = User.new
  end

  # GET /personnels/1/edit
  def edit
  end

  # POST /personnels
  # POST /personnels.json
  def create
    @personnel = User.new
    @personnel.first_name = params["first_name"]
    @personnel.last_name = params["last_name"]
    @personnel.phone_number = params["phone_number"]
    @personnel.title = params["title"]
    @personnel.email = params["email"]
    @personnel.password = params["email"]


    respond_to do |format|
      if @personnel.save
        @personnel.user_roles.create(:role_id => params["user_role"]["user_role_id"])
        format.html { redirect_to personnel_path(@personnel), notice: 'Personnel was successfully created.' }
        format.json { render :show, status: :created, location: @personnel }
      else
        format.html { render :new }
        format.json { render json: @personnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personnels/1
  # PATCH/PUT /personnels/1.json
  def update

    @personnel.first_name = params["first_name"]
    @personnel.last_name = params["last_name"]
    @personnel.phone_number = params["phone_number"]
    @personnel.title = params["title"]
    @personnel.email = params["email"]

    respond_to do |format|
      if @personnel.update(personnel_params)
        @personnel.user_roles.update(:role_id => params["role_id"]["user_role_id"])
        format.html { redirect_to personnel_path(@personnel), notice: 'Personnel was successfully updated.' }
        format.json { render :show, status: :ok, location: @personnel }
      else
        format.html { render :edit }
        format.json { render json: @personnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personnels/1
  # DELETE /personnels/1.json
  def destroy
    @personnel.destroy
    respond_to do |format|
      format.html { redirect_to personnels_url, notice: 'Personnel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personnel
      @personnel = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personnel_params
      params.permit(:first_name, :last_name, :phone_number, :title, :email)
    end

    def role_params
      params.permit(:user_role => {})
    end
end
