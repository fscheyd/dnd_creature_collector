class UsersController < ApplicationController
    
    get '/login' do
        erb :'users/login'
    end


    get '/users' do
        redirect to :"/users/#{current_user.id}"
    end

    post '/login' do
        # binding.pry
        user = User.find_by(character_name: params[:character_name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/monsters"
        else
            @errors = "Sorry the input was invalid."
            erb :"/users/login"

        end
    end



    get '/signup' do
        erb :signup

    end

    get '/users/:id/edit' do
        @user = User.find(params[:id])
        erb :"/users/edit"
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
            if @user
                erb :'/users/show'
            else
                redirect '/users/login'
            end
    end



    post '/users' do
       user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect "/monsters"       
        else
            @errors = " [ " + user.errors.full_messages.join(", ") + " ] "
            erb :'/signup'
        end
    end



    get '/logout' do
        session.clear
        redirect '/login'
    end
end