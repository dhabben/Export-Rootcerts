<#
 Thanks to zakird for a starting point with his code:
 https://gist.github.com/zakird/a8582ced2f50cfe1c702

 Example:
  Export-Rootcerts.ps1
  Export-Rootcerts.ps1 > Current-Certs.txt

 Use the output to compare to a clean install of Windows

 Also try the output of:
  Dir cert:\ -recurse

#>

$dir = "C:\Export\"
$type = [System.Security.Cryptography.X509Certificates.X509ContentType]::Cert


Get-ChildItem -Path cert:\LocalMachine\AuthRoot | ForEach-Object {
    Write-Output "======================================"
    Write-Output $_.GetCertHashString()
    Write-Output $_.FriendlyName
    Write-Output $_.GetIssuerName()
    Write-Output $_.GetEffectiveDateString()
    Write-Output $_.GetExpirationDateString()
    
    #$cerHash = $_.GetCertHashString()
    #[System.IO.File]::WriteAllBytes("$dir$cerHash.der", $_.export($type))
}
