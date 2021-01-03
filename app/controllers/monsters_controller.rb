class MonstersController < ApplicationController
    
    get '/monsters/new' do
        erb :'/monsters/new'
    end

    # get '/monsters' do
    #     authenticate
    #     @user = current_user
    #     @monsters = monster.all
    #     erb :"monsters/show"
    # end

    post '/monsters' do
        if !logged_in?
            redirect '/'
        end

        if params[:name, :monster_type] != ""
            @monster = monster.create(name: params[:name], monster_type: params[:monster_type], user_id: current_user.id)
            redirect "/monsters/#{@monster.id}"
        else
            redirect '/monsters/new'

    end
end