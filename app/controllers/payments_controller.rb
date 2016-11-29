class PaymentsController < ApplicationController
  #before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = params[:reservation]
    @final_cost = params[:final_cost]
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    nonce_from_the_client = params[:payment_method_nonce]
    # Use payment method nonce here...
    result = Braintree::Transaction.sale(
      :amount => params[:total_cost],
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
    )

    if result.success?
      flash[:notice] = "success!: #{result.transaction.id}"
      new_payment = Payment.create(
        total_cost: params[:total_cost])

      new_payment.save
      main_reservation = Reservation.find(params[:reservation_id])
      reservation = Reservation.where(check_in_date: main_reservation.check_in_date, user_id: main_reservation.user_id)
      reservation.each do |ind_record|
        ind_record.payment_id = new_payment.id
        ind_record.save
      end

    elsif result.transaction
      flash[:notice] = "Error processing transaction:"
      puts "  code: #{result.transaction.processor_response_code}"
      puts "  text: #{result.transaction.processor_response_text}"
    else
      flash[:notice] = result.errors
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.fetch(:payment, {})
    end
end
