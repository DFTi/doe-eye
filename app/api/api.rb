class API < Grape::API
	prefix 'api'
  version 'v1', using: :path
	format :json

	get :ping do
		{ :ping => params[:pong] || 'pong' }
	end

  resource :auth do
    desc 'creates the access_token if valid login'
    params do
      requires :api_key
      requires :api_password
    end
 
    post :login do
      vendor = Vendor.where(:api_key => params[:api_key])
      
      if vendor
        authorization = vendor.first.authorizations.create!
        { :access_tokem => authorization.access_token }
      else
        error!('Unauthorized.', 401)
      end
    end
  end

  resource :projects do
    get do
      Project.all
    end

    desc "Create a project record"
    params do
      group :project do
        requires :name
      end
    end

    post do
      project = Project.new(params[:project])
      if project.save
        { project_id: :project.id }
      else
        error!(project.errors.full_messages.join("\n"), 400)
      end
    end
  end

  resource :documents do
    desc 'Returns all documents for a project'
    params do
      requires :project_id
    end

    route_param :project_id do
      get do
        Document.where(project_id: params[:project_id])
      end
    end
  end
end
