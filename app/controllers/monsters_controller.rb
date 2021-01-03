class MonstersController < ApplicationController
    
    get '/monsters/new' do
        erb :'/monsters/new'
    end

    get '/monsters' do
        @monsters = Monster.all
        erb :'/monsters/index'
    end
    

    post '/monsters/new' do
        monster = Monster.new(params[:monster])
        if monster.save
            redirect "/monsters/#{monster.id}"
        else
            @errors = "[" + monster.errors.full_messages.join(", ") + "]"
            erb :"/monsters/new"
        end
    end
    

    get '/monsters/:id' do
        @monster = Monster.find(params[:id])
        erb :'/monsters/show'
    end

    get '/monsters/:id/edit' do
        @monster = Monster.find_by(id: params[:id])
        erb :'/monsters/edit'
    end

    patch '/monsters/:id' do
        @monster = Monster.find(params[:id])
        @monster.update(params[:monster])
        redirect :"/monsters/#{@monster.id}"
    end

    delete '/monsters/:id' do
        monster = Monster.find(params[:id])
        monster.delete
        redirect to "/monsters"
        
    end

end