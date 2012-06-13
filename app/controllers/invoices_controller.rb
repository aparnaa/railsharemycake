class InvoicesController < ApplicationController
  def index
        
	 @invoices = Invoice.all
	
        @myeve=[]
	@trans=[]
	@mem=[]
     @invoices.each do |inv|

 	@myeve<< Myevent.find_by_id(inv.myevent_id)
	@trans<< Transaction.find_by_id(inv.transaction_id) 
	@mem<< Member.find_by_id(inv.member_id)
end    
    
     respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoices }
    end
  end

  def show
	 @invoice = Invoice.find_by_id(params[:id])
	@myeve=Myevent.find_by_id(@invoice.myevent_id)
	@trans=Transaction.find_by_id(@invoice.transaction_id) 
	@mem=Member.find_by_id(@invoice.member_id)
	
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

 def contribution
  @invoice = Invoice.last
 @cont=@invoice.org_amt

 end

end
