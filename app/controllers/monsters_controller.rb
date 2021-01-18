class MonstersController < ApplicationController
    
    get '/monsters/new' do
        erb :'/monsters/new'
    end

    get '/monsters' do
        if logged_in? 
            @monsters = Monster.all
            @my_monsters = @monsters.select do |monster|
                monster.user == current_user
            end    
            erb :'/monsters/index'
        else
            redirect to '/login'
        end
    end
    

    post '/monsters/new' do
        if !logged_in?
            redirect '/login'
        end
        monster = Monster.new(params[:monster])
        if monster.save
            redirect "/monsters/#{monster.id}"
        else
            @errors = "[" + monster.errors.full_messages.join(", ") + "]"
            erb :"/monsters/new"
        end
    end
    

    get '/monsters/:id' do
        if !logged_in?
            redirect to '/login'
        end
            @monster = Monster.find(params[:id])
            if @monster.user_id == current_user.id
                erb :'/monsters/show'
            else
                redirect '/monsters'
            end
    end

  
    get '/monsters/:id/edit' do
        if !logged_in?
            redirect '/login'
        end
        @monster = Monster.find_by(id: params[:id])
        if @monster.user_id == current_user.id
            erb :'/monsters/edit'
        else
            redirect '/monsters' 
        end
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