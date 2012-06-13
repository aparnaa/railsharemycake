class OrganisationsController < ApplicationController
 # GET /organisations
  # GET /organisations.xml
  def index
    @organisations = Organisation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organisations }
    end
  end

  # GET /organisations/1
  # GET /organisations/1.xml
  def show
    @organisation = Organisation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @organisation }
    end
  end

  # GET /organisations/new
  # GET /organisations/new.xml
  def new
    @organisation = Organisation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @organisation }
    end
  end

  # GET /organisations/1/edit
  def edit
    @organisation = Organisation.find(params[:id])
  end

  # POST /organisations
  # POST /organisations.xml
  def create
   @organisation = Organisation.new( :phone=>params[:organisation][:phone].to_s, :organisation_name=> params[:organisation][:organisation_name],
	      :contact_person=> params[:organisation][:contact_person], :address_line1=> params[:organisation][:address_line1],
	      :address_line2=> params[:organisation][:address_line2], :website=> params[:organisation][:website],  :email=> params[:organisation][:email], :status=> params[:organisation][:status],  :created_at=> params[:organisation][:created_at],  
		  :updated_at=> params[:organisation][:updated_at], :category=> params[:organisation][:category], :description=> params[:organisation][:description]  )

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to(@organisation, :notice => 'Organisation was successfully created.') }
        format.xml  { render :xml => @organisation, :status => :created, :location => @organisation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @organisation.errors, :status => :unprocessable_entity }
      end
    end
  end






  # PUT /organisations/1
  # PUT /organisations/1.xml
  def update
    @organisation = Organisation.find(params[:id])
    params[:organisation][:phone]=params[:organisation][:phone].to_s
    
    respond_to do |format|
      if @organisation.update_attributes(:phone=>params[:organisation][:phone].to_s, :organisation_name=> params[:organisation][:organisation_name],
	      :contact_person=> params[:organisation][:contact_person], :address_line1=> params[:organisation][:address_line1],
	      :address_line2=> params[:organisation][:address_line2], :website=> params[:organisation][:website],  :email=> params[:organisation][:email], :status=> params[:organisation][:status],  :created_at=> params[:organisation][:created_at],  
		  :updated_at=> params[:organisation][:updated_at], :category=> params[:organisation][:category], :description=> params[:organisation][:description]  )
        format.html { redirect_to(@organisation, :notice => 'Organisation was successfully updated.') }
        format.xml  { head :ok }
      else 
        format.html { render :action => "edit" }
        format.xml  { render :xml => @organisation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1
  # DELETE /organisations/1.xml
  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy

    respond_to do |format|
      format.html { redirect_to(organisations_url) }
      format.xml  { head :ok }
    end
  end
end
