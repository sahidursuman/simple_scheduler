require "simple_scheduler/web_extension"

if defined?(Sidekiq::Web)
  Sidekiq::Web.register SimpleScheduler::WebExtension
  Sidekiq::Web.tabs["Simple Scheduler"] = "simple_scheduler"
end
