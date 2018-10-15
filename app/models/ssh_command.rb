#!/usr/bin/env ruby
# encoding: utf-8

require 'net/ssh'
# include TaskModel


class SshCommand < ApplicationRecord
	def self.ssh_send(message)
		host = '192.168.1.215'
		user = 'pi'
		pass = 'raspberry'

		Net::SSH.start(host, user, :password => pass) do |ssh|
		  ssh.exec!(message)
		end
	end

	def self.ssh_new
		id = Task.last.id
		min = Task.last.start_time.strftime("%M")
		hour= Task.last.start_time.strftime("%H")
		day_month= Task.last.start_date.strftime("%d")
		month= Task.last.start_date.strftime("%m")
		day_week = '*'
		device = '18'
		if Task.last.description.split.last == "on"
			action = '1'
		else
			action = '0'
		end
 		order = "gpio -g write #{device} #{action}"
		message1 = "touch #{id}"
		self.ssh_send(message1)
		aux = "#{min} #{hour} #{day_month} #{month} #{day_week} #{order}"
		message2 = "echo '#{aux}' >> /home/pi/Desktop/web-server/tasks/#{id}"
		self.ssh_send(message2)
		message3 = "crontab /home/pi/Desktop/web-server/tasks/#{id}"
		self.ssh_send(message3)
	end

	def self.ssh_edit(id)
		
	end

	def self.ssh_delete(id)
		message = "rm /home/pi/Desktop/web-server/tasks/#{id}"
		self.ssh_send(message)
		self.ssh_update
	end

	def self.ssh_update
		  ssh.exec!("crontab -r")
		  Task.each do |t|
		  	ssh.exec!("crontab /home/pi/Desktop/web-server/tasks/#{id}")
		  end
	end
end
