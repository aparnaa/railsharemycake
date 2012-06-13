class TransactionsController < ApplicationController
#before_filter :authenticate_member!
  def index
	 @transaction=Transaction.all
	 @id=current_member.id
	 @transaction=Transaction.find_all_by_member_id(@id)
  end

  def new
	@transaction=Transaction.new
       #puts  @eventid=params[:@a][:myevent_id]
        #@transaction.myevent_id=@eventid
  end

  def create
   $value

    params[:id]
    $value= params[:id]
   @transaction = Transaction.new(params[:transaction])
		
   ActiveMerchant::Billing::Base.mode = :test

   credit_card = ActiveMerchant::Billing::CreditCard.new(
 #my_paypal => 4513768958863924 
 # :number     => '4785636150538332', 
  :number     => "#{params[:transaction][:card_number]}",
  :month      => '8',
  :year       => '2019',
  :first_name => 'Tobias',
  :last_name  => 'Luetke',
  :verification_value  => '123'
)

  	if credit_card.valid?
  		 gateway=ActiveMerchant::Billing::PaypalGateway.new(
    :login => "john.n_1278592458_biz_api1.yahoo.co.in",
    :password => "1278592465",
    :signature => "AiPC9BjkCyDFQXbSkoZcgqH3hpacAFxPwudk.Im4wr8hZApTZwekIFFz"
  )
    response = gateway.authorize(15000, credit_card, :ip => "127.0.0.1")

  	   
		if response.success?
    gateway.capture(1000, response.authorization)

	

 		# puts "Payment complete!"
    #puts "Transaction is complete!"
    flash[:notice] = "Thank you, Transaction is sucessfully completed"
   # redirect_to '/home/aft_login'
  @transaction.myevent_id=params[:id]  
 
@transaction.save
 puts  params[:id] 
 puts @transaction.member_id
 puts @transaction.id  
  @trans=Transaction.last
  @event=Myevent.find_by_id(@trans.myevent_id)
  @sharepercentage=@event.share_amount
  @orgamount=(@trans.amount/100)*@sharepercentage
  @memberamount=@trans.amount-@orgamount
 
  @invoice=Invoice.new
  @invoice.transaction_id=@trans.id
  @invoice.member_id=current_member.id
  @invoice.myevent_id=@trans.myevent_id 	
  @invoice.org_amt=@orgamount
  @invoice.member_amt=@memberamount
  @invoice.save


   redirect_to '/transactions/done'

end
  	   else
             flash[:notice] = "Sorry"
            redirect_to '/transactions/error'
  	   end
	end
  
 def error
 end
 def contribution
 end

end
