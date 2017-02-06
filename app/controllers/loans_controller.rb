class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @owners = Owner.all
    @properties = Property.all
    @loan = Loan.new
  end

  # POST /loans
  # POST /loans.json
  def create
    @owners = Owner.all
    @properties = Property.all
    @loan = Loan.new(loan_params)

    respond_to do |format|
      if @loan.save
        GradeLoan.new(@loan).perform
        format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_loan
    @loan = Loan.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def loan_params
    params.require(:loan).permit(:amount_cents, :status, :owner_id, :property_id)
  end
end
