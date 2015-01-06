class ChatController < WebsocketRails::BaseController

  def client_connected
    increment_client_counter
    WebsocketRails[:clients].trigger 'client-count', controller_store[:client_counter]
    send_message :welcome, controller_store[:client_counter]
  end

  def client_disconnected
    decrement_client_counter
    WebsocketRails[:clients].trigger 'client-count', controller_store[:client_counter]
  end

  def create_post
    post = Post.create(message)

    WebsocketRails[:posts].trigger 'new', post
  end

  private

  def increment_client_counter
    if controller_store[:client_counter]
      controller_store[:client_counter] += 1
    else
      controller_store[:client_counter] = 1
    end
  end

  def decrement_client_counter
    controller_store[:client_counter] -= 1
  end
end
