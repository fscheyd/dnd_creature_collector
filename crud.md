# Create
## new
- displays form to make the new thing
- get /user/new
- new.erb

## Create
- processes the form, and actually makes and saves thing
- post /user
- no view, redirect to show or index
- Model.create

# Read
## index
- show all of the things
- get /user
- index.erb
- .all

## show
- details on one of the things
- get /userss/:id
- show.erb
- Model.find_by(id: params), .find

# Update
## Edit
- Displays for to change 1 thing
- /user/:id/edit
- edit.erb
- Model.find_by(id: params), .find


## Update
- processes the form to change the thing
- /put/patch
- /user/:id
- no view, redirect to show
- instance = Model.find_by(id: params)
- instance.update(params[:key])


# Delete
## destroy 
- process the form and destroys the thing
- delete
- /user/:id
- no view, redirect to index
- instance = Model.find_by(id: params)
- instance.destroy
 