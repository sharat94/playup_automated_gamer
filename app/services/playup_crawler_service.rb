class PlayupCrawlerService < CrawlerService
  def initialize
    @url = Rails.application.secrets.PLAYUP_URL
    super
  end

  def run
    begin
      login
      select_free_option
      select_game()
      @browser.close
      return self
    end
  end

  def login
    @browser.text_field(id: 'username').set(Rails.application.secrets.PLAYUP_USERNAME)
    @browser.text_field(:id, 'password').set(Rails.application.secrets.PLAYUP_PASSWORD)
    sleep 1
    @browser.element(class: 'button-0-11 primary-0-13 block-0-12').click
  end

  def select_free_option
    sleep 2
    @browser.lis.last.click
    @count = []
  end

  def select_game(count = @count)
    games = @browser.as(class: 'Tappable-inactive css-rhqy0g', visible: true)
    games.each_with_index do |game, index|
      next if (index.in? (count)) || @browser.div(class: 'css-1d1u96o', visible: true, index: index).text == "ENTERED"
      game.click
      @browser.span(class: 'css-1wd0u62').click
      @browser.button(class: 'button-0-11 primary-0-13 block-0-12').click
      @browser.button(class: 'css-8b0ko4').click
      sleep 1
      @browser.a(class: 'button-0-11 cancel-0-20').click
      @count.push(index)
      select_game()
    end
  end
end
