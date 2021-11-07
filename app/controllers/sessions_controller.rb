# class SessionsController < ApplicationController


 
#     def new
#       @user = User.new
#     end

#     def create
        
#         @user = User.find_by(id: params[:user][:user_id])
        
#         if @user.nil?
#           redirect_to '/login'

#         else
        
          
#         return head(:forbidden) unless 
#         @user.authenticate(params[:user][:password]) 
#         session[:user_id] = @user.id
        
        
#         redirect_to profile_path(@user.id)
#          end
#     end

#     def destroy
#       byebug
#         # session[:user_id] = nil
#         session.delete(:user_id)
#         redirect_to '/'
#       end


#       def omniauth

#         @user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
#           u.email = auth['info']['email']
#           u.username = auth['info']['name']
#           u.password = SecureRandom.hex(15)
    
#         end
#         byebug
#         # user = User.from_omniauth(request.env['omniauth.auth'])
#         if @user.valid?
#           session[:user_id] = @user.id
#           # flash[:message] = "Successful login"
#           redirect_to '/'
#         else
#           redirect_to '/login'
#         end
     
#       end
#       private

#       def auth
#         request.env['omniauth.auth']
#       end
        

# end

class SessionsController < ApplicationController

  def new
   
  end 

  def create
    if params[:provider] == 'google_oauth2'
      @user= User.from_omniauth(auth)
      create_session
      redirect_to profile_path(@user.id)

    else 
     #try to find dancer in the database
     @user = User.find_by(username: params[:user][:username])

    
     #did we find someone & did they put in the right pw
      if @user && @user.authenticate(params[:user][:password])
      create_session
      redirect_to profile_path(@user.id)
      else
        # flash[:error] = "Sorry, log info was incorrect. Please try again."
         redirect_to '/login'
      end 
    end
  end 


    def destroy
      session.delete(:user_id)
      # flash[:notice] = "You have successfully logged out."
      redirect_to '/' 
    end 

    def omniauth
        @user = User.from_omniauth(auth)
        
      if @user
        create_session
        redirect_to profile_path(@user.id)
      else 
        redirect_to '/login'
      end 
    end 
    
    private
    
    def auth
        request.env['omniauth.auth']
    end
    
    
end