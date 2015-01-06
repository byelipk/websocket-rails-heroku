class ChatController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def handle_connection
    puts "The connection is being handled!"
  end

  def liked_post
    send_message :liked_post, "Thanks for liking my post: #{message}"

    WebsocketRails[:likes].trigger 'new', message
  end

  def create_post
    post = Post.create(message)
    
    WebsocketRails[:posts].trigger 'new', post
  end
end
