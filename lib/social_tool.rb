module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY","eS3Rmq4G0JyAPbwhpFUfmwgsr")
      config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET","fTm36UqFln9a1HzdkakYR0R6aMq1yAAGAlrMwmbXFiPTxrxkEG")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN","1192328876-uUpXUBUZqROaEMQ1GBo1YDvVp6X69pSvePu9Lda")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET","azOCCdLLpqGB2kqjyzj1cIWImWC7ON15zM2IvYe9pf2eY")
    end
    client.search("#rails", result_type: 'recent').take(6).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end

