class FundAccountsController < ApplicationController
  before_action :set_fund_account, only: %i[ show edit update destroy ]

  # GET /fund_accounts or /fund_accounts.json
  def index
    @fund_accounts = FundAccount.all
  end

  # GET /fund_accounts/1 or /fund_accounts/1.json
  def show
  end

  # GET /fund_accounts/new
  def new
    @fund_account = FundAccount.new
  end

  # GET /fund_accounts/1/edit
  def edit
  end

  # POST /fund_accounts or /fund_accounts.json
  def create
    @fund_account = FundAccount.new(fund_account_params)

    respond_to do |format|
      if @fund_account.save
        format.html { redirect_to fund_account_url(@fund_account), notice: "Fund account was successfully created." }
        format.json { render :show, status: :created, location: @fund_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fund_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fund_accounts/1 or /fund_accounts/1.json
  def update
    respond_to do |format|
      if @fund_account.update(fund_account_params)
        format.html { redirect_to fund_account_url(@fund_account), notice: "Fund account was successfully updated." }
        format.json { render :show, status: :ok, location: @fund_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fund_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fund_accounts/1 or /fund_accounts/1.json
  def destroy
    @fund_account.destroy

    respond_to do |format|
      format.html { redirect_to fund_accounts_url, notice: "Fund account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fund_account
      @fund_account = FundAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fund_account_params
      params.require(:fund_account).permit(:entity, :account_type, :ifsc, :name, :bank_account, :account_number, :vpa_address, :active, :contact_id)
    end
end
