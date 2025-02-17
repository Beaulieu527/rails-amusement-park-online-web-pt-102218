def new
    @user = User.new
end 

def create
    @user = User.find_by(id: params[:user][:name])
    # byebug
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else 
        redirect_to new_session_path
    end 
end 

def destroy
    session.clear
    redirect_to root_path
end 