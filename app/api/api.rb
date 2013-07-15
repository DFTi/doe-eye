class API < Grape::API
	prefix 'api'

	format :json

	get :ping do
		{ :ping => params[:pong] || 'pong' }
	end
end
