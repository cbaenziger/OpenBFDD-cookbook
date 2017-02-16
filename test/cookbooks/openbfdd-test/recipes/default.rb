# Start to OpenBFDD beacons and see if they can heartbeat to eachother

bfd_beacon 'Beacon1' do
  control '127.0.0.1:1001'
  listen '127.0.0.1:1002'
  action :start
end

bfd_beacon 'Beacon2' do
  control '127.0.0.1:2001'
  listen '127.0.0.1:2002'
  action :start
end

bfd_session 'Connect Beacon2 to Beacon1' do
  action :connect
  remote_ip '127.0.0.1:2001'
  local_ip '127.0.0.1:1001'
end

bfd_session 'Connect Beacon1 to Beacon2' do
  action :connect
  remote_ip '127.0.0.1:1001'
  local_ip '127.0.0.1:2001'
end

bfd_session 'Bring Up Beacon2 to Beacon1' do
  action :up
  remote_ip '127.0.0.1:2001'
  local_ip '127.0.0.1:1001'
end

bfd_session 'Bring Up Beacon1 to Beacon2' do
  action :up
  remote_ip '127.0.0.1:1001'
  local_ip '127.0.0.1:2001'
end
