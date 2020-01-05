set :output, "log/crontab.log"


 every 1.hours do
   rake "init:relations"
   rake "init:messages"
 end

