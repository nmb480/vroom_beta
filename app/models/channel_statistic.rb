class ChannelStatistic < ApplicationRecord
  belongs_to :channel, foreign_key: :channel_id

  def self.updateChannelStitistics

    # config/initializers/youtube.rbの設定を読み込む
    client, youtube = get_service

    Channel.all.each do |vtuber|

      channelId = vtuber['channelId']

      # 検索開始
      result = client.execute!(
          :api_method => youtube.channels.list,
          :parameters => {
            :part => 'statistics',
            :id   => channelId
          }
      )

      statistics = result.data.items.first.statistics

      viewCount       = statistics['viewCount']
      subscriberCount = statistics['subscriberCount']
      videoCount      = statistics['videoCount']

      if vtuber.channel_statistics
        @statistics = vtuber.channel_statistic.update_attributes(viewCount: viewCount, subscriberCount: subscriberCount, videoCount: videoCount)
      else
        @statistics = vtuber.channel_statistic.build_attributes(viewCount: viewCount, subscriberCount: subscriberCount, videoCount: videoCount)
        @statistics.save
      end
    end

  end
end
