class Controller
  attr_accessor :routes

  def call(env)
    action
    @response_text
  end

  def action
    @response_text = ''
  end

end

class Router

  def initialize(routes)
    @routes = routes
  end

  def call(env)
    controller_class = @routes[env['PATH_INFO']]
    if controller_class.nil?
      [404, {}, ['not found']]
    else
      controller = controller_class.new
      [200, {}, [controller.call(env)]]
    end
  end
end
