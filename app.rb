require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('pry')
require('./lib/volunteer')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "volunteer_tracker"})

get '/' do
  @projects = Project.all
  erb(:projects)
end

get '/projects' do
  @projects = Project.all
  erb(:projects)
end

post '/projects' do
  project = Project.new({:title => params[:title], :id => nil })
  project.save
  @projects = Project.all()
  erb(:projects)
end

get '/projects/:id' do
  @project = Project.find(params[:id].to_i())
   erb(:project)
end

get '/projects/:id/edit' do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch '/projects/:id' do
  @project = Project.find(params[:id].to_i())
  @project.update(:title => params[:title], :id => nil)
  redirect to('/projects')
end

delete '/projects/:id' do
  @project = Project.find(params[:id].to_i())
  @project.delete
  redirect to('/projects')
end

get '/projects/:id/volunteers/:volunteer_id' do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  erb(:volunteers)
end

post '/projects/:id/volunteers' do
  @project = Project.find(params[:id].to_i())
  @volunteer = Volunteer.new({:name => params[:name], :project_id => @project.id, :id => nil})
  @volunteer.save()
  erb(:project)
end

patch '/projects/:id/volunteers/:volunteer_id' do
  @project = Project.find(params[:id].to_i())
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  @volunteer.update(:name => params[:name], :project_id => @project.id)
  erb(:project)
end

delete '/projects/:id/volunteers/:volunteer_id' do
  volunteer = Volunteer.find(params[:volunteer_id].to_i)
  volunteer.delete()
  @project = Project.find(params[:id].to_i())
  erb(:project)
end