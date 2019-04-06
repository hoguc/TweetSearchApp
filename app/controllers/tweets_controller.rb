class TweetsController < ApplicationController
  def top
  end

  def search
    Dotenv.load

    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_API_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET_KEY']
    end

    puts ENV['TWITTER_API_KEY']
    puts ENV['TWITTER_SECRET_KEY']
    puts config.consumer_key
    puts config.consumer_secret

    @tweets = []
    since_id = nil

    #検索ワードが存在していたらツイートを取得
    if params[:keyword].present?
      #リツイートを除く、検索ワードにひっかかったツイートを取得する
      tweets = client.search("#" + params[:keyword], count: 100, result_type: "recent", exclude: "retweets", since_id: since_id)
      #取得したツイートをモデルに渡す
      tweets.take(100).each do |tw|
        tweet = Tweet.new(tw.full_text)
        @tweets << tweet
      end
      @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(10)   
    end
  end
end
