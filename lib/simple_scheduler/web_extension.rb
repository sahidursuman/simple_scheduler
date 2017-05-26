module SimpleScheduler
  # Adds routes/actions for Sidekiq web UI.
  module WebExtension
    def self.registered(app)
      app.settings.locales << File.join(File.expand_path("..", __FILE__), "locales")

      # Simple Scheduler Page
      app.get "/simple_scheduler" do
        @tasks = SimpleScheduler::Task.all.sort_by { |task| task.params[:name] }
        file_path = File.join(File.expand_path("..", __FILE__), "views", "simple_scheduler.html.erb")
        render(:erb, File.read(file_path))
      end
    end
  end
end
