#Get the current sessions on $Server and also format the output
$DirtyOuput = (quser /server:$Server) -replace '\s{2,}', ',' | ConvertFrom-Csv
 
#Go through each session
Foreach ($session in $DirtyOuput) {
 
  #Check if SESSION isn't like "Active"
  If (($session.STATE -notlike "Active")) {
    # Log off the disconnected Sessions
    logoff $session.SESSIONNAME /server:$Server
	}
  }
 
