class ImportersController < ApplicationController
  before_action :set_importer, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :csv

  # GET /importers
  # GET /importers.json
  def index
    @importers = Importer.includes(:status, :operation).as_json(include: { status: { only: [:name] }, operation: { only: [:name] } })
  end

  # GET /importers/1
  # GET /importers/1.json
  def show
  end

  def csv
    job = Delayed::Job.enqueue ImportJob.new(params[:csvfile].path)
    render json: job.id
  end

  # GET /importers/new
  def new
    @importer = Importer.new
  end

  # GET /importers/1/edit
  def edit
  end

  # POST /importers
  # POST /importers.json
  def create
    @importer = Importer.new(importer_params)

    respond_to do |format|
      if @importer.save
        format.html { redirect_to @importer, notice: 'Importer was successfully created.' }
        format.json { render :show, status: :created, location: @importer }
      else
        format.html { render :new }
        format.json { render json: @importer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /importers/1
  # PATCH/PUT /importers/1.json
  def update
    respond_to do |format|
      if @importer.update(importer_params)
        format.html { redirect_to @importer, notice: 'Importer was successfully updated.' }
        format.json { render :show, status: :ok, location: @importer }
      else
        format.html { render :edit }
        format.json { render json: @importer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /importers/1
  # DELETE /importers/1.json
  def destroy
    @importer.destroy
    respond_to do |format|
      format.html { redirect_to importers_url, notice: 'Importer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def refresh
    render json: Importer.includes(:status, :operation).as_json(include: { status: { only: [:name] }, operation: { only: [:name] } })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_importer
      @importer = Importer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def importer_params
      params.require(:importer).permit(:company, :invoice_num, :invoice_date, :operation_date, :amount, :reporter, :notes, :status_id, :category, :operation_id)
    end
end
