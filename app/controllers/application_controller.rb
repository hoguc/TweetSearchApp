class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        search_tweet_path
    end
end
