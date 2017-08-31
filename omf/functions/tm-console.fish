function tm-console
  set -l password (pass Ticketmaster/techops | head -1)
  console -u mike.goodness --password "$password"
end
