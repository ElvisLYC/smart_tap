class SshCommandsController < ApplicationController

	def ssh_send
		host = '192.168.0.186'
		user = 'pi'
		pass = 'raspberry'
		Net::SSH.start('192.168.0.186', 'pi', :password => "raspberry") do |ssh|
		  ssh.exec!('touch mycron')
		  ssh.exec!('echo "00 09 * * * hello" >> mycron')
		  ssh.exec!('crontab mycron')
		  ssh.exec!('rm mycron')
		end
	end

end
