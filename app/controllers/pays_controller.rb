class PaysController < ApplicationController
  before_action :set_pay, only: %i[ show edit update destroy ]

  # GET /pays or /pays.json
  def index
    @pays = Pay.all
  end

  # GET /pays/1 or /pays/1.json
  def show
  end

  # GET /pays/new
  def new
    @pay = Pay.new
  end

  # GET /pays/1/edit
  def edit
  end

  # POST /pays or /pays.json
  def create
    @pay = Pay.new(pay_params)

    respond_to do |format|
      if @pay.save

        id = @pay.id
        payout_task(id)
        # system("bundle exec rake demo:payout_task[#{id}]")

        format.html { redirect_to pay_url(@pay), notice: "Pay was successfully created." }
        format.json { render :show, status: :created, location: @pay }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pay.errors, status: :unprocessable_entity }
      end
    end
  end


  
  # PATCH/PUT /pays/1 or /pays/1.json
  def update
    respond_to do |format|
      if @pay.update(pay_params)
        format.html { redirect_to pay_url(@pay), notice: "Pay was successfully updated." }
        format.json { render :show, status: :ok, location: @pay }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pays/1 or /pays/1.json
  def destroy
    @pay.destroy

    respond_to do |format|
      format.html { redirect_to pays_url, notice: "Pay was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay
      @pay = Pay.find(params[:id])
    end

    def payout_task(iid)
      url = 'https://api.razorpay.com/v1/payouts'
  
      auth = {
        username: 'rzp_test_edrAOJvMDHb7C6',
        password: 'svshRUsXYGnCn4FlBQQAq3M7'
      }
  
       c= Pay.find_by(id: iid)
  
      data = 
      {
        account_number: 2323230049955583,
        amount: 400,
        currency: 'INR',
        mode: 'UPI',
        purpose: 'refund',
        fund_account: {
            account_type: 'vpa',
            vpa: {
                address: c.upi_id
            },
            contact: {
                name: c.name,
                email: c.email,
                contact: c.contact_no,
                type: 'employee',
                reference_id: 'Acme Contact ID 12345',
            }
        },
        queue_if_low_balance: true,
        reference_id: 'Acme Transaction ID 12345',
        narration: 'Acme Corp Fund Transfer',
    }
  
      response = HTTParty.post( url, basic_auth: auth, body: data.to_json, headers: { 'Content-Type' => 'application/json' })
    end

    # Only allow a list of trusted parameters through.
    def pay_params
      params.require(:pay).permit(:name, :contact_no, :email, :upi_id)
    end
end
