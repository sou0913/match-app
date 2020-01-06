set :output, "log/crontab.log"

job_type :rake, 'cd :path && :environment_variable=:environment bundle exec /usr/local/bundle/bin/rake :task :output'

 every 1.hours do
   rake "init:relations"
   rake "init:messages"
 end

