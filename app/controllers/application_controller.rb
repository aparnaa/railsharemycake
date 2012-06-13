class ApplicationController < ActionController::Base
  protect_from_forgery


def after_sign_in_path_for resource_or_scope
   if current_member.role=="admin" then
     return '/home/admin_login'
   else
     return'/home/aft_login'
   end
 end

def after_sign_out_path_for(resource_or_scope)
    new_member_session_path
  end 

end

