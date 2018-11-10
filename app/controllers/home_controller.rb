class HomeController < ApplicationController
  before_action :set_user, only: [:show_personnel, :edit_personnel]

  def index
  	@appointment = Appointment.new
  end


  def profile
  end

  def download_data
    @users = User.all

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "Medical_Records-#{Date.today}.csv" }
    end
  end

  # def personnels
  #   @users = User.all
  # end

  # def new_personnel
  #   @user = User.new
  # end

  # def create_personnel
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       flash[:success] = "Hi #{@user.first_name} was successfully created."
  #       format.html { redirect_to root_path, success: 'Appointment was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @appointment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def show_personnel
  #   set_user
  # end

  # def edit_personnel
  #   set_user
  # end

  # def update_personnel
  #   set_user
  # end

  def admin

    @state = ""
    if params[:term].nil?
      @records = Record.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
      @state = "default"
      report(@records)
    else
      case params[:term]
      when "week"
        @records = Record.where(created_at: DateTime.now.beginning_of_week..DateTime.now.end_of_week)
        @state = "week"
        report(@records)
      when "month"
        @state = "month"
        @records = Record.where(created_at: DateTime.now.beginning_of_month..DateTime.now.end_of_month)
        report(@records)
      when "year"
        @state = "year"
        @records = Record.where(created_at: DateTime.now.beginning_of_year..DateTime.now.end_of_year)
        report(@records)
      when "all"
        @state = "all"
        @records = Record.all
        report(@records)
      else
        @state = "selected_date"
        @records = Record.where(created_at: Date.parse(params[:term]).beginning_of_day..Date.parse(params[:term]).end_of_day)
        report(@records)
      end
    end

    # if params[:term]
    #   @records = Record.where(created_at: Date.parse(params[:term]).beginning_of_day..Date.parse(params[:term]).end_of_day)
    # elsif params[:week]
    #   @records = Record.where(created_at: DateTime.now.beginning_of_week..DateTime.now.end_of_week)
    # elsif params[:month]
    #   @records = Record.where(created_at: DateTime.now.beginning_of_month..DateTime.now.end_of_month)
    # elsif params[:year]
    #   @records = Record.where(created_at: DateTime.now.beginning_of_year..DateTime.now.end_of_year)
    # elsif params[:all]
    #   @records = Record.all
    # else
    #   @records = Record.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    # end
  end

  private

  def set_user
      @user = User.find(params[:id])
    end

  def report(records)
      respond_to do |format|
      format.html
      format.csv { send_data records.to_csv, filename: "Medical_Records-#{Date.today}.csv" }
    end
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :title)
    end

end
