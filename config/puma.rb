preload_app!

rackup      DefaultRackup
port        ENV["PORT"]     || 3000
environment ENV["RACK_ENV"] || "development"
