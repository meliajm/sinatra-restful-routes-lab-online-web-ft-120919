class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # coded actions here!

  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    # @recipe = Recipe.new
    # binding.pry
    erb :new
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  

  post '/recipes' do 
    # @recipe = Recipe.create(params[:name], params[:ingredients], params[:cook_time])
    # @recipe = Recipe.create(params)
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id" do
    Recipe.destroy(params[:id])
    redirect to "/recipes"
  end





end

