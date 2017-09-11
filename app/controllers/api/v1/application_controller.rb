module API
  module V1
    class ApplicationController < ActionController::Base
      include API::ErrorResponse

      # Prevent CSRF attacks by raising an exception.
      # For APIs, you may want to use :null_session instead.
      # protect_from_forgery with: :exception
      # protect_from_forgery with: :null_session
      # skip_before_action :verify_authenticity_token

      # Make sure all request has been authorized
      before_action :doorkeeper_authorize!
      before_action :authorize_user

      # Get user from doorkeeper_token
      # Use before_action for each controller
      # See example usages
      def authorize_user
        raise unless User.find(doorkeeper_token.resource_owner_id)
      rescue
        response_unauthorized
      end

      # Get current user (from with token)
      def current_user
        @current_user = User.find(doorkeeper_token.resource_owner_id)
        @current_user.freeze
      rescue
        nil
      end

      # Get the current application
      def current_application
        @current_application ||= Application.find(doorkeeper_token.application_id)
        @current_application.freeze
      rescue
        nil
      end

    end
  end
end
