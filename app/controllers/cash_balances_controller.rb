class CashBalancesController < ApplicationController
  before_action :require_admin, except:[ :index, :show ]
  before_action :set_cash_balance, only: %i[show edit update destroy]
  


  # GET /cash_balances or /cash_balances.json
def index
  @cash_balances = CashBalance.includes(:community, :receipts)

  @total_balance = Receipt.sum(:monthly_price)
end
  # GET /cash_balances/1 or /cash_balances/1.json
  def show
  end

  # GET /cash_balances/new
  def new
    @cash_balance = CashBalance.new
  end

  # GET /cash_balances/1/edit
  def edit
  end

  # POST /cash_balances or /cash_balances.json
  def create
    @cash_balance = CashBalance.new(cash_balance_params)

    respond_to do |format|
      if @cash_balance.save
        format.html { redirect_to @cash_balance, notice: "Cash balance was successfully created." }
        format.json { render :show, status: :created, location: @cash_balance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cash_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_balances/1 or /cash_balances/1.json
  def update
    respond_to do |format|
      if @cash_balance.update(cash_balance_params)
        format.html { redirect_to @cash_balance, notice: "Cash balance was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @cash_balance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cash_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_balances/1 or /cash_balances/1.json
  def destroy
    @cash_balance.destroy!

    respond_to do |format|
      format.html { redirect_to cash_balances_path, notice: "Cash balance was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_balance
      @cash_balance = CashBalance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cash_balance_params
      params.expect(cash_balance: [ :community_id, :financial_year, :current_amount, :status ])
    end
end
