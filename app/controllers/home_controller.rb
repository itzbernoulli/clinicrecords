class HomeController < ApplicationController

  def index
  	@appointment = Appointment.new
  end


  def profile
  end

  def personnels
    @users = User.all
  end

  def admin
    if params[:term]
      # puts DateTime.parse(params[:term])
      # puts Time.parse(params[:term])
      # puts Date.strptime("12/13/2013", "%m/%d/%Y")
      # puts Time.zone.now.beginning_of_day
      @records = Record.where(created_at: Date.parse(params[:term]))
    else
      @records = Record.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    end
  	#Personnel count = 
  	#Record Today
  end

end
