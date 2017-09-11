module API::ErrorResponse

  def response_bad_request(*args)
    arg = args.first
    errors = []
    begin
      arg[:errors].details.map do |field, details|
        details.map do |error_details|
          errors << { field: field.to_s, code: error_details[:error].to_s, message: "" }
        end
      end
    rescue
    end

    render status: 400,
      json: {
        source: {
          pointer: request.original_url
        },
        errors: errors
      }
  end


  def response_unauthorized
    render status: 401,
      json: {
        source: {
          pointer: request.original_url
        },
        errors: [ { message:  "Unauthorized" } ]
      }
  end


  def response_forbidden
    render status: 403,
      json: {
        source: {
          pointer: request.original_url
        },
        errors: [ { message:  "Forbidden" } ]
      }
  end


  # Page not found, item not found
  def response_not_found
    render status: 404,
      json: {
        source: {
          pointer: request.original_url
        },
        errors: [ { message:  "Not Found" } ]
      }
  end


  def response_unprocessable_entity
    render status: 422,
      json: {
        source: {
          pointer: request.original_url
        },
        errors: [ { message:  "Unprocessable Entity" } ]
      }
  end


  def response_internal_server_error
    render status: 500,
      json: {
        source: {
          pointer: request.original_url
        },
        errors: [ { message:  "Internal server errors" } ]
      }
  end

  def custom_error_response(*args)
    arg = args.first
    errors = []
    begin
      arg[:errors].details.map do |field, details|
        details.map do |error_details|
          errors << { field: field.to_s, code: error_details[:error].to_s, message: "" }
        end
      end
    rescue
    end

    render status: 422,
      json: {
        source: {
          pointer: request.original_url
        },
        errors: errors
      }
  end

end
