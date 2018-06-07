class CrawlerService
  attr_accessor :errors

  def initialize
    @errors = {}
    init_browser_session
  end

  private

  def init_browser_session
      @browser = Watir::Browser.new :chrome
      @browser.driver.manage.window.maximize
      size = @browser.window.size
      @browser.goto @url
      # Rails.logger "The browser window is #{size.width} wide by #{size.height} high"
      puts "The browser window is #{size.width} wide by #{size.height} high"
  end
end
