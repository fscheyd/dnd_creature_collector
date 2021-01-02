class UsersController < ApplicationController
    


    #renders login page
    get '/login' do
        erb :login
    end

    post '/login' do
        @user = User.find_by(character_name: params[:character_name])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            puts session
            redirect "users/#{@user.id}"
        else
        
        end
    end


    get '/signup' do
        erb :signup

    end

    post '/users' do
        if params[:character_name] != "" && params[:email] != "" && params[:password] != ""
            @user = User.new(params)
            redirect "/users/#{@user.id}"
        
        else
            puts "Character is lost in the woods"
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end
end