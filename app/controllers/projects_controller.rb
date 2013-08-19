class ProjectsController < ApplicationController
  
  before_filter :authenticate_admin!

  def new
    @project = Project.new
  end

end
