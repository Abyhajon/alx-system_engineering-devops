#puppet manuscript to kill a process.

exec { 'pkill':
  command => 'usr/bin/pkill killmenow',
  onlyif  => 'usr/bin/pgrep killmenow',
}

