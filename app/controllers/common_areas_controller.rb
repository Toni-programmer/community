class CommonAreasController < ApplicationController
  before_action :require_admin, except: %i[index show]
  before_action :set_common_area, only: %i[ show edit update destroy ]

  # GET /common_areas or /common_areas.json
  def index
    @common_areas = community_scope(CommonArea)
  end

  # GET /common_areas/1 or /common_areas/1.json
  def show
  end

  # GET /common_areas/new
  def new
    @common_area = CommonArea.new
  end

  # GET /common_areas/1/edit
  def edit
  end

  # POST /common_areas or /common_areas.json
  def create
    @common_area = CommonArea.new(common_area_params)

    respond_to do |format|
      if @common_area.save
        format.html { redirect_to @common_area, notice: "Common area was successfully created." }
        format.json { render :show, status: :created, location: @common_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @common_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /common_areas/1 or /common_areas/1.json
  def update
    respond_to do |format|
      if @common_area.update(common_area_params)
        format.html { redirect_to @common_area, notice: "Common area was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @common_area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @common_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common_areas/1 or /common_areas/1.json
  def destroy
    @common_area.destroy!

    respond_to do |format|
      format.html { redirect_to common_areas_path, notice: "Common area was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_area
      @common_area = community_scope(CommonArea).find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def common_area_params
      params.expect(common_area: [ :community_id, :name, :area_type ])
    end
end
