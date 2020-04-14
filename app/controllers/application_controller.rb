class ApplicationController < ActionController::API
  
    # def secret
    #     ENV["MY_SECRET"]
    #   end
    
      # Generate a JSON Web Token with some data and our secret
      def generate_token(data)
        JWT.encode(data, "secret")
      end
    
    
      def decode_token
        # Access the token we've been given as part of the headers
        token = request.headers["Authorization"]
        # Attempt to decode the token we've been given using our secret and return the decoded information, which will be a hash containing the user's id
        begin
          JWT.decode(token, "secret").first
        # If an error is thrown because the token is invalid, we return an empty hash instead
        rescue
          {}
        end
      end
    
      def get_user
        # Decode the token and pull out the user's id from it
        id = decode_token["id"]
        # Attempt to find and return the user with that id, otherwise, this will return nil
        User.find_by(id: id)
      end
end
