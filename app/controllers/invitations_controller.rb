class InvitationsController < ApplicationController

  #before_filter :myevent
before_filter :authenticate_member!
  # GET /invitations
  # GET /invitations.xml
  def index
    @invitations = Invitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invitations }
    end
  end

  # GET /invitations/1
  # GET /invitations/1.xml
  def show
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invitation }
    end
  end

  # GET /invitations/new
  # GET /invitations/new.xml
  def new
    @invitation = Invitation.new
    @contacts=current_member.contacts
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invitation }
    end
  end

  # GET /invitations/1/edit
  def edit
    @invitation = Invitation.find(params[:id])
    @contacts=current_member.contacts
  end

  # POST /invitations
  # POST /invitations.xml
  def create
   @member=current_member
    @invitation=Invitation.new(params[:invitation])
   
    
    respond_to do |format|
      if @invitation.save
        @myevent.invitations << @invitation
        
        format.html { redirect_to event_invitations_path, :notice => 'Invitation was successfully sent to your friends email address.' }
        format.json { render :json => @invitation, :status => :created, :location => @invitation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invitations/1
  # PUT /invitations/1.xml
  def update
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      if @invitation.update_attributes(params[:invitation])
        format.html { redirect_to(@invitation, :notice => 'Invitation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.xml
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to(invitations_url) }
      format.xml  { head :ok }
    end
  end

  def event_create

	@a=Myevent.new(params[:@myevent])
	@a.save
	 @contacts = Contact.find_all_by_member_id(current_member.id)	
  end

  def myevent
       myevent=Myevent.find_by_id(params[:myevent_id])  
  end

  def send_invite

	@eventid=params[:@a][:myevent_id]
        @myevent=Myevent.find_by_id(@eventid)

      	@q=Invitation.new
	@q.sender=current_member.id
	@q.email=params[:@a][:email]
	@q.message=params[:message]
	@q.myevent_id=@eventid
       	@q.save
    
        @mail=params[:@a][:email]
        Notifier.send_mail(@mail,@myevent).deliver





  end



def event_detail
@myevent = Myevent.all
end


end
