class LongtermGoalsController < ApplicationController
  before_action :set_longterm_goal, only: [:show, :edit, :update, :destroy]

  # GET /longterm_goals
  # GET /longterm_goals.json
  def index
    @longterm_goals = LongtermGoal.all
  end

  # GET /longterm_goals/1
  # GET /longterm_goals/1.json
  def show
  end

  # GET /longterm_goals/new
  def new
    @longterm_goal = LongtermGoal.new
  end

  # GET /longterm_goals/1/edit
  def edit
  end

  # POST /longterm_goals
  # POST /longterm_goals.json
  def create
    @longterm_goal = LongtermGoal.new(longterm_goal_params)

    respond_to do |format|
      if @longterm_goal.save
        format.html { redirect_to @longterm_goal, notice: 'Longterm goal was successfully created.' }
        format.json { render :show, status: :created, location: @longterm_goal }
      else
        format.html { render :new }
        format.json { render json: @longterm_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /longterm_goals/1
  # PATCH/PUT /longterm_goals/1.json
  def update
    respond_to do |format|
      if @longterm_goal.update(longterm_goal_params)
        format.html { redirect_to @longterm_goal, notice: 'Longterm goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @longterm_goal }
      else
        format.html { render :edit }
        format.json { render json: @longterm_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /longterm_goals/1
  # DELETE /longterm_goals/1.json
  def destroy
    @longterm_goal.destroy
    respond_to do |format|
      format.html { redirect_to longterm_goals_url, notice: 'Longterm goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_longterm_goal
      @longterm_goal = LongtermGoal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def longterm_goal_params
      params.require(:longterm_goal).permit(:category_id, :target_time_min, :actual_time_min, :successful)
    end
end
