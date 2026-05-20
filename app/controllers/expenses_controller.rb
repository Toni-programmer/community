class ExpensesController < ApplicationController
  before_action :require_admin, except:[ :index, :show ]
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    base = current_user.admin? ? Expense : Expense.joins(:cash_balance).where(cash_balances: { community_id: current_user.community_ids })
    @q = base.ransack(params[:q])
    @expenses = @q.result
               .includes(:cash_balance)
               .order(created_at: :desc)
               .paginate(page: params[:page], per_page: 2)
  end

  # GET /expenses/1 or /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: "Expense was successfully created." }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: "Expense was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy!

    respond_to do |format|
      format.html { redirect_to expenses_path, notice: "Expense was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      base = current_user.admin? ? Expense : Expense.joins(:cash_balance).where(cash_balances: { community_id: current_user.community_ids })
      @expense = base.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.expect(expense: [ :cash_balance_id, :supplier_id, :incidence_id, :amount, :date, :status ])
    end
end
