class IcDsController < ApplicationController
  before_action :set_icd, only: [:show, :edit, :update, :destroy]

  # GET /icds
  # GET /icds.json
  def index
    @icds = Icd.all
  end

  # GET /icds/1
  # GET /icds/1.json
  def show
  end

  # GET /icds/new
  def new
    @icd = Icd.new
  end

  # GET /icds/1/edit
  def edit
  end

  # POST /icds
  # POST /icds.json
  def create
    @icd = Icd.new(icd_params)

    respond_to do |format|
      if @icd.save
        format.html { redirect_to @icd, notice: 'Icd was successfully created.' }
        format.json { render :show, status: :created, location: @icd }
      else
        format.html { render :new }
        format.json { render json: @icd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /icds/1
  # PATCH/PUT /icds/1.json
  def update
    respond_to do |format|
      if @icd.update(icd_params)
        format.html { redirect_to @icd, notice: 'Icd was successfully updated.' }
        format.json { render :show, status: :ok, location: @icd }
      else
        format.html { render :edit }
        format.json { render json: @icd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /icds/1
  # DELETE /icds/1.json
  def destroy
    @icd.destroy
    respond_to do |format|
      format.html { redirect_to icds_url, notice: 'Icd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icd
      @icd = Icd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def icd_params
      params.require(:icd).permit(:code, :title)
    end
end
