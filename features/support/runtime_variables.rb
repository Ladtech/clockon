module Settings
  def app_port
    ENV['port'] || 9292
  end

  def log_file
    File.open(ENV['log'], 'r') if ENV['log']
  end

end

World Settings