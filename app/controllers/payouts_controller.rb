class PayoutsController < ApplicationController
  before_action :set_payout, only: %i[ show edit update destroy ]

  # GET /payouts or /payouts.json
  def index
    @payouts = Payout.all
  end

  # GET /payouts/1 or /payouts/1.json
  def show
  end

  # GET /payouts/new
  def new
    @payout = Payout.new
  end

  # GET /payouts/1/edit
  def edit
  end

  # POST /payouts or /payouts.json
  def create
    @payout = Payout.new(payout_params)

    respond_to do |format|
      if @payout.save
        format.html { redirect_to payout_url(@payout), notice: "Payout was successfully created." }
        format.json { render :show, status: :created, location: @payout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payouts/1 or /payouts/1.json
  def update
    respond_to do |format|
      if @payout.update(payout_params)
        format.html { redirect_to payout_url(@payout), notice: "Payout was successfully updated." }
        format.json { render :show, status: :ok, location: @payout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payouts/1 or /payouts/1.json
  def destroy
    @payout.destroy

    respond_to do |format|
      format.html { redirect_to payouts_url, notice: "Payout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payout
      @payout = Payout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payout_params
      params.require(:payout).permit(:account_number, :amount, :currency, :mode, :purpose, :fund_account_id)
    end
end
