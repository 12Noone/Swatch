class ProjectsController < ApplicationController
	before_action :require_current_user


	def index
		@project = Project.all
 
 	end
		
	

	def new 
		@house = House.find(params["house_id"])

		@project = Project.new
		@project.house_id = @house.id
	end

	def show 
      	@comment = Comment.new
      	@house = House.find(params["house_id"])
		@project = Project.find(params[:id])
		respond_to do |format|
      		format.html  # show.html.erb
      		format.json  { render :json => @project }
      	end

	end


	def create
		@project = Project.new(project_params)
		@project.house_id = params["house_id"]
		puts "CREATE THE THING"
		puts @project.house_id
		# TODO: handle errors here
		@project.save

		# redirect_to root_path
		redirect_to house_projects_path
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update		
		@project = Project.find(params[:id])
		@project.update(project_params)
		redirect_to project_path(@project)
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		respond_to do |format|
			format.html {redirect_to projects_url}
		end
	end

	private

 	def project_params
 		params.require(:project).permit(:title, :image1, :image2, :image3, :image4, :image5, :content, :notes1, :notes2, :notes3, :notes4, :notes5, :tag_list)
 	end
end
