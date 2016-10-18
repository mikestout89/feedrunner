module ApplicationHelper
  def post_data(uri, data)
    data = {name: fl.name, email:fl.email, list: "dzmpyN7630PwI12W6jOWnEgw", boolean: true}
    uri = 'subscribe'
    host = Rails.application.secrets.sendy_host
    response_data = {}
    RestClient.post(host+uri, data.to_json){ |response, request, result, &block|
      case response.code
      when 200
        p "It worked !"
        response_data = response.body
      when 400
        p "400 BAD request HTTP error code"
        response_data = response.body
        p response.body
      when 403
        p response.body
      when 404
        p "404 BAD request HTTP error code"
        response_data = response.body
        p response.body
      when 500
        p "500 Internal Server Error"
        response_data = response.body
      else
        p "post response.code>>>>>>>#{response.code}"
      end
    }
    response_data
  end
end
