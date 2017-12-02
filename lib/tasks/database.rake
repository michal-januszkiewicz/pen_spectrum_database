namespace :db do
  task :drop do
    `bundle exec hanami db drop`
    $stdout.puts "db dropped"
  end

  task :create do
    `bundle exec hanami db create`
    $stdout.puts "db created"
  end

  task :migrate do
    `bundle exec hanami db migrate`
    $stdout.puts "db migrated"
  end

  task :prepare do
    `bundle exec hanami db prepare`
    $stdout.puts "db prepared"
  end

  namespace :test do
    task :drop do
      `HANAMI_ENV=test bundle exec hanami db drop`
      $stdout.puts "test db dropped"
    end

    task :create do
      `HANAMI_ENV=test bundle exec hanami db create`
      $stdout.puts "test db created"
    end

    task :migrate do
      `HANAMI_ENV=test bundle exec hanami db migrate`
      $stdout.puts "test db migrated"
    end

    task :prepare do
      `HANAMI_ENV=test bundle exec hanami db prepare`
      $stdout.puts "test db prepared"
    end
  end
end
