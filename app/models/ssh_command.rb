#!/usr/bin/env ruby
# encoding: utf-8

require 'net/ssh'
# include TaskModel


class SshCommand < ApplicationRecord

	def self.ssh_send(message)
		host = '192.168.1.215'
		user = 'pi'
		pass = 'raspberry'
		begin
			Net::SSH.start(host, user, :password => pass) do |ssh|
			  ssh.exec!(message)
		  end
		rescue Net::SSH::AuthenticationFailed => e
		  redirect_to user_tasks_path, notice: 'There was a connection error'
		rescue Net::SSH::SocketError => e
		  redirect_to user_tasks_path, notice: 'There was a connection error'
		end
	end

	def self.ssh_new(id)
		min = Task.find(id).start_time.strftime("%M")
		hour= Task.find(id).start_time.strftime("%H")
		day_month= Task.find(id).start_date.strftime("%d")
		month= Task.find(id).start_date.strftime("%m")
		day_week = '*'
		device = '18'
		if Task.find(id).description.split.last == "on"
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
		# message3 = "crontab /home/pi/Desktop/web-server/tasks/#{id}"
		message3 = "(crontab -l ; cat /home/pi/Desktop/web-server/tasks/#{id}) | crontab -" 
		self.ssh_send(message3)
	end

	def self.ssh_update(id)
		message = "rm /home/pi/Desktop/web-server/tasks/#{id}"
		self.ssh_send(message)
		self.ssh_new(id)
		self.ssh_refresh()
	end

	def self.ssh_delete(id)
		message = "rm /home/pi/Desktop/web-server/tasks/#{id}"
		self.ssh_send(message)
		self.ssh_refresh()
	end

	def self.ssh_refresh()
	  self.ssh_send("crontab -r")
	  self.ssh_send("echo '0 0 1 1 * echo new' | crontab -")
	  Task.all.each do |t|
	  	self.ssh_send("(crontab -l ; cat /home/pi/Desktop/web-server/tasks/#{t.id}) | crontab -")
	  end
	end
end
