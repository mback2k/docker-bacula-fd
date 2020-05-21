#!/bin/bash -e

echo "
Director {
  Name = bacula-dir
  @/etc/bacula/bacula-fd-password
}

FileDaemon {
  Name = $(hostname -f)
  WorkingDirectory = \"/var/lib/bacula\"
  PidDirectory = \"/run/bacula\"
  PluginDirectory = \"/usr/lib/bacula\"
  Maximum Concurrent Jobs = 20
  FD Address = 0.0.0.0
  FD Port = 9102
}

Messages {
  Name = Standard

  director = bacula-dir = all, !skipped, !restored
}
" > /etc/bacula/bacula-fd.conf

exit 0
