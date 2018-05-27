class IntegrationsController < ApplicationController
  before_action :set_integration, only: [:show, :edit, :update, :destroy]

  # GET /integrations
  # GET /integrations.json
  def index
    @integrations = Integration.all
  end

  # GET /integrations/1
  # GET /integrations/1.json
  def show
  end

  # GET /integrations/new
  def new
    @integration = Integration.new
  end

  # GET /integrations/1/edit
  def edit
  end

  # POST /integrations
  # POST /integrations.json
  def create
    @integration = Integration.new(integration_params)

    respond_to do |format|
      if @integration.save
        format.html { redirect_to @integration, notice: 'Integration was successfully created.' }
        format.json { render :show, status: :created, location: @integration }
      else
        format.html { render :new }
        format.json { render json: @integration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /integrations/1
  # PATCH/PUT /integrations/1.json
  def update
    respond_to do |format|
      if @integration.update(integration_params)
        format.html { redirect_to @integration, notice: 'Integration was successfully updated.' }
        format.json { render :show, status: :ok, location: @integration }
      else
        format.html { render :edit }
        format.json { render json: @integration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /integrations/1
  # DELETE /integrations/1.json
  def destroy
    @integration.destroy
    respond_to do |format|
      format.html { redirect_to integrations_url, notice: 'Integration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_integration
      @integration = Integration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def integration_params
      params.require(:integration).permit(:user_id, :name, :key, :details)
    end
end
