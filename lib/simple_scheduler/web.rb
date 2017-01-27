require "simple_scheduler/web_extension"

if defined?(Sidekiq::Web)
  Sidekiq::Web.register SimpleScheduler::WebExtension

  if Sidekiq::Web.tabs.is_a?(Array)
    # For sidekiq < 2.5
    Sidekiq::Web.tabs << "simple_scheduler"
  else
    Sidekiq::Web.tabs["Simple Scheduler"] = "simple_scheduler"
  end
end
