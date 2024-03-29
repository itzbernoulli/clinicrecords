class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
  #change query parameters for the where clause based on who has updated
    if current_user.is_frontdesk?
      @records = Record.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
      render "/frontdesk/index"
    elsif current_user.is_nurse?
      @records = Record.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
      render "/nurses/index"
    elsif current_user.is_doctor?
      @records = Record.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).where(nurse_updated: true)
      render "/doctors/index"
    elsif current_user.is_pharmacist?
      @records = Record.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).where(doctor_updated: true)
      render "/pharmacists/index"
    else
      @records = Record.all
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    if current_user.is_frontdesk?
      redirect_to frontdesk_path(@record)
    elsif current_user.is_nurse?
      redirect_to nurse_path(@record)
    elsif current_user.is_doctor?
      redirect_to doctor_path(@record)
    elsif current_user.is_pharmacist?
      redirect_to pharmacist_path(@record)
    elsif current_user.is_admin?
    end
  end

  # GET /records/new
  def new
    @record = Record.new
    if current_user.is_frontdesk?
      redirect_to "/frontdesk/new"
    elsif current_user.is_nurse?
      render "/nurses/new"
    elsif current_user.is_doctor?
      render "/doctors/new"
    elsif current_user.is_pharmacist?
      render "/pharmacists/new"
    elsif current_user.is_admin?
    end
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)
    set_user_and_time

    respond_to do |format|
      if @record.save
            if current_user.is_frontdesk?
              format.html { redirect_to frontdesk_path(@record), notice: 'Record was successfully created.' }
            elsif current_user.is_nurse?
              format.html { redirect_to nurse_path(@record), notice: 'Record was successfully created.' }
            elsif current_user.is_doctor?
              format.html { redirect_to doctor_path(@record), notice: 'Record was successfully created.' }
            elsif current_user.is_pharmacist?
              format.html { redirect_to pharmacst_path(@record), notice: 'Record was successfully created.' }
            else
              format.html { redirect_to @record, notice: 'Record was successfully created.' }
            end
        # format.html { redirect_to @record, notice: 'Record was successfully created.' }
        # format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    set_user_and_time
    # @record.record_icds.delete_all
    # icd_string= params["icd_array"]
    # if icd_string.length > 1
    #   icd_string.split(",").each do |icd|
    #     @record.record_icds.create(icd_id: icd)
    #   end
    # end
    

    respond_to do |format|
      if @record.update(record_params)
        if current_user.is_frontdesk?
              format.html { redirect_to frontdesk_index_path, notice: 'Patient record was successfully created.' }
            elsif current_user.is_nurse?
              format.html { redirect_to nurse_path(@record), notice: 'Patient record was successfully updated.' }
            elsif current_user.is_doctor?
              format.html { redirect_to doctor_path(@record), notice: 'Patient record was successfully updated.' }
            elsif current_user.is_pharmacist?
              format.html { redirect_to pharmacist_path(@record), notice: 'Patient record was successfully updated.' }
            else
              format.html { redirect_to @record, notice: 'Patient record was successfully updated.' }
            end
        # format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        # format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:icd_id,:name, :dob, :gender, :address, :health_care_provider, :department_id, :complaints, :diagnosis, :treatment, :height, :weight, :temperature, :blood_pressure, :drugs_given, :front_desk_updated, :nurse_updated, :doctor_updated, :pharmarcist_updated, :front_desk_name, :nurse_name, :doctor_name, :pharmacist_name, :nurse_update_time, :doctor_update_time, :pharmacist_update_time)
    end

    def set_user_and_time
          if current_user.is_frontdesk?
            @record.front_desk_name = current_user.fullname
          elsif current_user.is_nurse?
            @record.nurse_update_time = DateTime.now
            @record.nurse_name = current_user.fullname
            @record.nurse_updated = true
          elsif current_user.is_doctor?
            @record.doctor_name = current_user.fullname
            @record.doctor_update_time = DateTime.now
            @record.doctor_updated = true
            puts params[:icd_id]
          elsif current_user.is_pharmacist?
            @record.pharmacist_name = current_user.fullname
            @record.pharmacist_update_time = DateTime.now
            @record.pharmacist_updated = true
          else
            @record.admin_name = current_user.fullname
            @record.admin_update_time = DateTime.now
          end
    end

end
