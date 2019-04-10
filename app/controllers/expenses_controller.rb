class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /expenses
  # GET /expenses.json
  def index
    @categories = Category.where(user: current_user)

  end

  def load
    @start_date = Date.new(params[:year].to_i, params[:month].to_i, 1)
    # @start_date = Date.current.beginning_of_month
    @end_date = @start_date.end_of_month
    amountFrom = params[:amountFrom].presence || 0
    amountTo = params[:amountTo].presence || Expense.maximum(:amount)
    # @categories = Category.where(user: current_user)
    @expenses = Expense
                    .where(date: @start_date..@end_date)
                    .where(category_id: params[:category_id])
                    .where('description like ?', "%#{params[:description]}%")
                    .where(amount: amountFrom.to_f..amountTo.to_f)
                    .order(sort_column + " " + sort_direction)
    render partial: 'expenses/table'
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html {redirect_to new_expense_path, success: 'Expense was successfully created.'}
        format.json {render :new}
      else
        format.html {render :new}
        format.json {render json: @expense.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html {redirect_to @expense, notice: 'Expense was successfully updated.'}
        format.json {render :show, status: :ok, location: @expense}
      else
        format.html {render :edit}
        format.json {render json: @expense.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html {redirect_to expenses_url, notice: 'Expense was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_params
    # params[:expense][:amount] = params[:expense][:amount].gsub(",",".").to_f
    # puts params
    delocalize_config = {amount: :number, date: :date}
    params.require(:expense).
        permit(*delocalize_config.keys, :description, :category_id).
        delocalize(delocalize_config)
    #
    # params.require(:expense).permit(:amount, :date, :description, :category_id)
  end

  def sort_column
    Expense.column_names.include?(params[:sort]) ? params[:sort] : "date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
