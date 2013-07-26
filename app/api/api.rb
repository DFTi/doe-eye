class API < Grape::API
	prefix 'api'
  version 'v1', using: :path
	format :json
  
  ### Helpers
  helpers do
    def authenticate!
      error!('Unauthorized. Invalid or expired token.', 401) unless current_vendor
    end

    def current_vendor    
      access_token = params[:access_token]
      authorization = Authorization.where(access_token: access_token).first
      
      if authorization 
        @current_vendor = Vendor.find(authorization.vendor_id)
      else 
        false
      end
    end
  end
  
  ### System API
	get :ping do
		{ :ping => params[:pong] || 'pong' }
	end
  
  ### Vendor API
  resource :vendor do
    desc 'creates the access_token if valid login'
    params do
      requires :api_key
      requires :api_password
    end
 
    post :login do
      vendor = Vendor.where(:api_key => params[:api_key])
      if vendor
        @authorization = vendor.first.authorizations.gt(expires_at: DateTime.now.utc.to_s).first
        @authorization ||= vendor.first.authorizations.create!
        { :access_token =>  @authorization.access_token }
      else
        error!('Unauthorized.', 401)
      end
    end
  end
  
  ### Project API
  resource :projects do
    desc "Returns all projects for the vendor"
    params do
      requires :access_token, type: String, desc: "Vendor Access Token"
    end
    
    get do
      authenticate!
      current_vendor.projects
    end
    
    desc "Returns the project details"
    params do
      requires :access_token, type: String, desc: "Vendor Access Token"
      requires :id, type: String, desc: "Project Id"
    end

    get "/:id" do
      authenticate!
      project = Project.find(params[:id])
      present project 
    end

    desc 'Returns all documents for a project'
    params do
      requires :access_token, type: String, desc: "Vendor Access Token"
      requires :id
    end

    get "/:id/documents" do
      Document.where(project_id: params[:id])
    end

    desc "Create a new project"
    params do
      requires :access_token, type: String, desc: "Vendor access Token" 
      group :project do
        requires :name
        requires :created_at
      end
    end

    post do
      authenticate!
      safe_params = ActionController::Parameters.new(params).permit(:project => [:name, :created_at])
      project = current_vendor.projects.create(safe_params[:project])
      if project.save
        { project_id: project.id }
      else
        error!(project.errors.full_messages.join("\n"), 400)
      end
    end
  end
  
  ### Documents API
  resource :documents do 
    desc "Returns the document details"
    params do
      requires :access_token, type: String, desc: "Vendor Access Token"
      requires :id, type: String, desc: "Document Id"
    end

    get "/:id" do
      authenticate!
      document = Document.find(params[:id])
      present document 
    end

    desc "Create a new document"
    params do
      requires :access_token, type: String, desc: "Vendor Access Token"
      requires :project_id, type: String, desc: "Project Id"
      group :document do
        requires :title
        requires :file
      end
    end

    post do 
      authenticate!
      safe_params = ActionController::Parameters.new(params).permit(:document => [:title, :file])
      project = Project.find(params[:project_id])
      document = project.documents.create(safe_params[:document])
      document.file = params[:document][:file]
      if document.save
        { document_id: document.id }
      else
        error!(document.errors.full_messages.join("\n"), 400)
      end
    end
  end
end
