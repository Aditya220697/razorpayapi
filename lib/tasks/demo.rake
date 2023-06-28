namespace :demo do
  desc 'TODO'
  task :payout_task, [:id] => :environment do |task, args|
    require 'httparty'
    id= args[:id]
    url = 'https://api.razorpay.com/v1/payouts'

    auth = {
      username: 'rzp_test_edrAOJvMDHb7C6',
      password: 'svshRUsXYGnCn4FlBQQAq3M7'
    }

     c= Pay.find_by(id: id)

    data = 
    {
      account_number: 2323230049955583,
      amount: 2700,
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

    # Access the response data
    puts response.code
    puts response.body

  end

  # task fund_account_task: :environment do

  #   url = 'https://api.razorpay.com/v1/fund_account'

  #   auth = {
  #     username: 'rzp_test_edrAOJvMDHb7C6',
  #     password: 'svshRUsXYGnCn4FlBQQAq3M7'
  #   }

  #   data = {
  #     name: 'John',
  #     contact: 9123456789,
  #     email: gaurav.kumar@example.com,
  #     type: employee,
  #   }

  #   response = HTTParty.post( url, basic_auth: auth, body: data.to_json, headers: { 'Content-Type' => 'application/json' })

  #   # Access the response data
  #   puts response.code
  #   puts response.body

  # end

end
