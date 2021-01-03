class UsersController < ApplicationController
    
    get '/login' do
        erb :'users/login'
    end


    get '/users' do
        @user = User.find_by(id: params[:id])
        erb :'/show'
    end

    post '/login' do
        @user = User.find_by(character_name: params[:character_name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "users/#{@user.id}"
        else
            redirect "/login"
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



    # post '/users' do
    #     if params[:character_name] != "" && params[:email] != "" && params[:password] != ""
    #         @user = User.create(params)
    #         session[:user_id] = @user.id

    #         redirect "/users/#{@user.id}"
        
    #     else
    #         redirect '/signup'
    #     end
    # end



    get '/logout' do
        session.clear
        redirect '/login'
    end
end