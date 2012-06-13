class MyeventsController < ApplicationController
  
before_filter :authenticate_member!
  def index
        @myevent = Myevent.find_all_by_member_id(current_member.id)
   respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @myevents }
    end
  end  

 def adminindex
    @myevent = Myevent.all
   respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @myevents }
    end
  end  
 
  def show
 @myevent = Myevent.find(params[:id])

  respond_to do |format|
      format.html # show.html.erb
     format.xml  { render :xml => @myevent }
    end
  end

def event 

end

def cause
       
date=params[:@myevent][:date]

parameters=params["@myevent"]

 @year=parameters["date(1i)"]
 @month=parameters["date(2i)"]
 @day=parameters["date(3i)"]
 @date=Date.strptime("#{@month}/#{@day}/#{@year}", '%m/%d/%Y')
 @hr=parameters["time(4i)"]
 @min=parameters["time(5i)"]
 @time=DateTime.strptime("#{@month}/#{@day}/#{@year} #{@hr}:#{@min}:0", '%m/%d/%Y %H:%M:%S')

	
    puts session[:value]={:phone_number=>params[:@myevent][:mobile_number], :title=>params[:@myevent][:title], :date=>@date, :time=>@time, :venue=>params[:@myevent][:venue], :description=>params[:@myevent][:description]}

end

def orgname

end


def education
    session[:value][:cause]='education'
    puts session[:value].inspect
     @org=Organisation.find_all_by_category("education")
end

def pollution
	session[:value][:cause]="pollution"
	@org=Organisation.find_all_by_category("pollution")

end

def food
	session[:value][:cause]="food"
	@org=Organisation.find_all_by_category("food")
end

def environment
     session[:value][:cause]="environment"
     @org=Organisation.find_all_by_category("environment")
		@org.each do |a|
		puts a.organisation_name
		end

end

def template

 session[:value][:member_id]=current_member.id
 session[:value][:organisation_name]=params[:@myevent][:organisation_name]
 session[:value][:share_amount]=params[:@myevent][:share_amount]


end

def message


 
  if params[:Template]=="Template1"
    session[:value][:message] ="We’ll dance and cheer as a birthday is here . She will be turning one more year older so, let’s shout “happy birthday to you!"
  elsif params[:Template]=="Template2" 
    session[:value][:message] ="It’s my birthday and you are invited to share the joy. There will be fun, food and frolic."
  else
    session[:value][:message] ="We eagerly look forward to your joining us on this occasion . Please don't forget to bring your family along."
  end

end


def invitation
	session[:value][:message]=params[:@myevent][:message]
end

 

#end

def event 

end

def cause
       
date=params[:@myevent][:date]

parameters=params["@myevent"]

 @year=parameters["date(1i)"]
 @month=parameters["date(2i)"]
 @day=parameters["date(3i)"]
 @date=Date.strptime("#{@month}/#{@day}/#{@year}", '%m/%d/%Y')
 @hr=parameters["time(4i)"]
 @min=parameters["time(5i)"]
 @time=DateTime.strptime("#{@month}/#{@day}/#{@year} #{@hr}:#{@min}:0", '%m/%d/%Y %H:%M:%S')

	
    puts session[:value]={:mobile_number=>params[:@myevent][:mobile_number], :title=>params[:@myevent][:title], :date=>@date, :time=>@time, :venue=>params[:@myevent][:venue], :description=>params[:@myevent][:description]}

end

def orgname

end


def education
    session[:value][:cause]='education'
    puts session[:value].inspect
     @org=Organisation.find_all_by_category("education")
end

def pollution
	session[:value][:cause]="pollution"
	@org=Organisation.find_all_by_category("pollution")

end

def food
	session[:value][:cause]="food"
	@org=Organisation.find_all_by_category("food")
end

def environment
     session[:value][:cause]="environment"
     @org=Organisation.find_all_by_category("environment")
		@org.each do |a|
		puts a.organisation_name
		end

end

def template

 session[:value][:member_id]=current_member.id
 session[:value][:organisation_name]=params[:@myevent][:organisation_name]
 session[:value][:share_amount]=params[:@myevent][:share_amount]


end

def message


  if params[:Template]=="Template1"
    session[:value][:message] ="We’ll dance and cheer as a birthday is here . She will be turning one more year older so, let’s shout “happy birthday to you!"
  elsif params[:Template]=="Template2" 
    session[:value][:message] ="It’s my birthday and you are invited to share the joy. There will be fun, food and frolic."
  else
    session[:value][:message] ="We eagerly look forward to your joining us on this occasion . Please don't forget to bring your family along."
  end

end


def invitation
	session[:value][:message]=params[:@myevent][:message]
end

 

end
