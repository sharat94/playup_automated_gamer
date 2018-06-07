class PlayCrawlerWorker
  include Sidekiq::Worker

  def perform()
    PlayupCrawlerService.new.run
    puts 'Crawler Service Completed.  '
  end
end
