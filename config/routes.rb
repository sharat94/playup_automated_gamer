require "sidekiq/web"
Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(Rails.application.secrets.SIDEKIQ_USERNAME)) &
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(Rails.application.secrets.SIDEKIQ_PASSWORD))
end
Rails.application.routes.draw do

  mount Sidekiq::Web, at: "/sidekiq"
  root :to => redirect('/sidekiq')
end