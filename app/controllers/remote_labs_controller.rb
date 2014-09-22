class RemoteLabsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  before_action :set_remote_lab, only: [:show, :edit, :update, :destroy]

  # GET /remote_labs
  # GET /remote_labs.json
  def index
    @remote_labs = RemoteLab.all
    authorize RemoteLab
  end

  # GET /remote_labs/1
  # GET /remote_labs/1.json
  def show
    authorize @remote_lab
  end

  # GET /remote_labs/new
  def new
    @remote_lab = RemoteLab.new
    @remote_lab.inputs.build
    authorize @remote_lab
  end

  # GET /remote_labs/1/edit
  def edit
    authorize @remote_lab
  end

  # POST /remote_labs
  # POST /remote_labs.json
  def create
    @remote_lab = RemoteLab.new(remote_lab_params)
    @remote_lab.user = current_user

    authorize @remote_lab

    respond_to do |format|
      if @remote_lab.save
        format.html { redirect_to @remote_lab, notice: 'Remote lab was successfully created.' }
        format.json { render :show, status: :created, location: @remote_lab }
      else
        format.html { render :new }
        format.json { render json: @remote_lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remote_labs/1
  # PATCH/PUT /remote_labs/1.json
  def update
    authorize @remote_lab
    respond_to do |format|
      if @remote_lab.update(remote_lab_params)
        format.html { redirect_to @remote_lab, notice: 'Remote lab was successfully updated.' }
        format.json { render :show, status: :ok, location: @remote_lab }
      else
        format.html { render :edit }
        format.json { render json: @remote_lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remote_labs/1
  # DELETE /remote_labs/1.json
  def destroy
    authorize @remote_lab
    @remote_lab.destroy
    respond_to do |format|
      format.html { redirect_to remote_labs_url, notice: 'Remote lab was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remote_lab
      @remote_lab = RemoteLab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remote_lab_params
      params.require(:remote_lab).permit(:title, :version, :author, :school, :user_id,
                                         :lab_type, :password, :allowable_time,
                                         inputs_attributes: [:id, :name, :pin_type, :pin, :data_type, :data_rate, :data_units, :_destroy])
    end
end
