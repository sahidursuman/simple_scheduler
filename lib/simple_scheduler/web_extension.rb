module SimpleScheduler
  # Adds routes/actions for Sidekiq web UI.
  module WebExtension
    def self.registered(app)
      app.settings.locales << File.join(File.expand_path("..", __FILE__), "locales")

      # Simple Scheduler Page
      app.get "/simple_scheduler" do
        @future_jobs = FutureJob.all
        view_path = File.join(File.expand_path("..", __FILE__), "views", "simple_scheduler.html.erb")
        render(:erb, File.read(view_path))
      end
    end
  end
end
