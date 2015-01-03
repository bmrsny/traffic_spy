module TrafficSpy

  # Sinatra::Base - Middleware, Libraries, and Modular Apps
  #
  # Defining your app at the top-level works well for micro-apps but has
  # considerable drawbacks when building reusable components such as Rack
  # middleware, Rails metal, simple libraries with a server component, or even
  # Sinatra extensions. The top-level DSL pollutes the Object namespace and
  # assumes a micro-app style configuration (e.g., a single application file,
  # ./public and ./views directories, logging, exception detail page, etc.).
  # That's where Sinatra::Base comes into play:
  #
  class Server < Sinatra::Base
    set :views, 'lib/views'

    get '/' do
      erb :index
    end

    not_found do
      erb :error
    end

    post '/sources' do
      if !params.key?('identifier') || !params.key?('rootUrl')
        halt 400, "Missing Parameter(s)"
      elsif Source.exist?(params[:identifier])
        halt 403, "Registered Applicant Already Exists"
      elsif params.key?('identifier') && params.key?('rootUrl')
        Source.create(params)
        status 200
      end
    end

    post '/sources/:identifier/data' do |identifier|
      payload = JSON.parse(params[:payload])
      #refactor below, we don't want conditionals
      if Source.exist?(identifier)
        if !payload.key?('url')
          halt 400, "Payload has no url key"
        elsif Payload.exist?(payload, identifier)
          halt 403, "Payload exists in the Payload database"
        elsif
          Payload.create(payload, identifier)
          status 200
        end
      else
        "Please register first fucker"
        status 403
      end
    end

    get '/sources/:identifier' do |identifier|
      sorted_urls = Payload.sorted_urls_by(identifier)
      web_browser_breakdown = UserAgent.web_browser_breakdown_by(identifier)
      os_browser_breakdown = UserAgent.web_os_breakdown_by(identifier)
      sorted_resolutions = Resolution.sorted_resoutions_by(identifier)

      erb :application_details, locals: {
        sorted_urls: sorted_urls,
        web_browser_breakdown: web_browser_breakdown,
        os_browser_breakdown: os_browser_breakdown,
        identifier: identifier
        }
    end

  end
end
