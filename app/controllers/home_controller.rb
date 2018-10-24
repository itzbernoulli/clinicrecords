class HomeController < ApplicationController

  def index
  	@appointment = Appointment.new
  end


  def profile
  end

  def admin
  end

end
