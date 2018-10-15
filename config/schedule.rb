# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#!/usr/bin/env ruby 
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'environment'))
env :PATH, ENV['PATH']
ENV['RAILS_ENV'] = "development"
set :job_template, nil

set :environment, "development"
set :output, {:error => "log/whenever.log", :standard => "log/whenever.log"}


every 1.day, at: '13:26 am' do
every 2.minute do
	runner "CronTask.turn_on"
	rake "schedule:turn_on" 
	command "echo 'running task'"
end

every 1.minute do
	rake "turn_off" 
end

every 1.minutes do
  command "cd :path && :environment_variable=:environment bundle exec whenever --update-crontab :output"
end