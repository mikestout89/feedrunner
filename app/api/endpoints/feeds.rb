module Endpoints
  class Feeds < Grape::API

    resource :feeds do

      # Tips API test
      # /api/v1/tips/ping
      # results  'tips endpoints'
      get :ping do
        { :ping => 'tips endpoints' }
      end

      # Create new feed
      # POST: /api/v1/feeds
      #   Parameters accepted
      #     first_name          String *
      #     last_name           String *
      #     email               String *
      #     ip                  String *
      #     category            String *
      #   Results
      #     {status: 1, data: posted successfully}

      post do
        if params[:first_name].present? and params[:email].present?
          feed = Feed.new(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], ip:params[:ip], category:params[:category])
          if feed.save
            {status: 1, data: "posted successfully"}
          else
            {status: 0, data: feed.errors.full_messages}
          end
        else
          {status: 0, data: "service can't accept null data"}
        end
      end

    end
  end
end
