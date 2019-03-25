class TweetsController < ApplicationController
  def search
    client = Twitter::REST::Client.new do |config|
    config.consumer_key    = "tw3XTI4e5XSyg3dCqFeJXlIDJ"
    config.consumer_secret = "C8cydZbb38RRgzFkfLQc0OrO8uZ9LRatLU9uZ2bYt6yjxpzFum"
    end

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
    end
  end

  def favorite
  end
end
