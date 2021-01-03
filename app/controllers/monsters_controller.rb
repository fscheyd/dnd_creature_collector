class MonstersController < ApplicationController
    
    get '/monsters/new' do
        erb :'/monsters/new'
    end

    get '/monsters' do
        authenticate
        @user = current_user
        @monsters = monster.all
        erb :"monsters/show"
    end

    post '/monsters' do

    end
end