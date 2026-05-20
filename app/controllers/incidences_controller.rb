class IncidencesController < ApplicationController
  before_action :require_admin, only: %i[edit update destroy]
  before_action :set_incidence, only: %i[ show edit update destroy ]

  # GET /incidences or /incidences.json
 def index
  @incidences = community_scope(Incidence).order(created_at: :desc)
                         .paginate(page: params[:page], per_page: 2)
 end

  # GET /incidences/1 or /incidences/1.json
  def show
  end

  # GET /incidences/new
  def new
    @incidence = Incidence.new
  end

  # GET /incidences/1/edit
  def edit
  end

  # POST /incidences or /incidences.json
  def create
    @incidence = Incidence.new(incidence_params)

    respond_to do |format|
      if @incidence.save
        format.html { redirect_to @incidence, notice: "Incidence was successfully created." }
        format.json { render :show, status: :created, location: @incidence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @incidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidences/1 or /incidences/1.json
  def update
    respond_to do |format|
      if @incidence.update(incidence_params)
        format.html { redirect_to @incidence, notice: "Incidence was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @incidence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @incidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidences/1 or /incidences/1.json
  def destroy
    @incidence.destroy!

    respond_to do |format|
      format.html { redirect_to incidences_path, notice: "Incidence was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incidence
      @incidence = community_scope(Incidence).find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def incidence_params
      params.expect(incidence: [ :community_id, :user_id, :description, :date, :status, :photo ])
    end
end
