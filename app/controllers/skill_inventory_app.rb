# require 'models/skill_inventory'

class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/skills' do
    @skills = skill_inventory.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    skill_inventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = skill_inventory.find(id.to_i)
    erb :show
  end

  get '/skills/:id/edit' do |id|
    @skill = skill_inventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    skill_inventory.update(params[:skill], id.to_i)
    redirect '/skills'
  end

  delete '/skills/:id' do |id|
    skill_inventory.delete(id.to_i)
    redirect '/skills'
  end

  def skill_inventory
    if ENV["RACK_ENV"] == "test" #if envt set to test, use test db
      database = YAML::Store.new('db/skill_inventory_test')
    else
      database = YAML::Store.new('db/skill_inventory') #how you manipulate yaml file
    end
    @skill_inventory ||= SkillInventory.new(database) #makes a new instance var if not already there
  end

end

#CRUD out the functionality for a user to be able to add a skill (id, name, status), see all skills, edit a skill, and delete a skill
