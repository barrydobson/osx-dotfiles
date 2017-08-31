function tm-vpn --description 'Connects/disconnects Ticketmaster VPN' --argument command code
  if test -z "$command"
    echo "usage: tm-vpn connect|disconnect"
    return 1
  end

  set -l password (pass Ticketmaster/okta | head -1)
  set -l connect_string "Mike.Goodness\n$password\n3\n$code\ny\n"
  set -l anyconnect_path "/opt/cisco/anyconnect/bin/vpn"

  if string match -i -q "connect" $command
    echo -e $connect_string | eval $anyconnect_path -s connect ravpn.livenation.com
  else if string match -i -q "disconnect" $command
    eval $anyconnect_path disconnect
  end
end
