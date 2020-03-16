# PowerShell Profile

$sav1 = $ErrorActionPreference
$ErrorActionPreference = 'SilentlyContinue'


## Environment

## User executables
$env:PATH += ";$home\bin"


## Aliases

remove-item alias:curl
remove-item alias:wget

### which
New-Alias -Name 'which' -Value where.exe

### edit (text)
New-Alias -Name 'edit' -Value notepad.exe

### MkDocs python static site generator
New-Alias -Name 'mkdocs' -Value ([IO.Path]::Combine($env:LocalAppdata, 'Packages\PythonSoftwareFoundation.Python.3.8_qbz5n2kfra8p0\LocalCache\local-packages\Python38\Scripts', 'mkdocs.exe'))

## Functions

### Go home

## BigFix prefetch details
function bfprefetch ($file) {
    $f = Get-Item -Path $file
    $hash1 = Get-FileHash -Path $f.FullName -Algorithm SHA1
    $hash2 = Get-FileHash -Path $f.FullName -Algorithm SHA256
    $msg = @"
prefetch $($f.Name)    
 sha1:$($hash1.Hash)
 size:$($f.Length)
 <URL>
 sha265:$($hash2.Hash)
"@ 
    Write-Output $msg
}    

function home () {
    Set-Location $home
}    

### pretty prompt
function Global:prompt {"`nPS [$Env:USERNAME@$Env:COMPUTERNAME] $($PWD.ProviderPath)`n> "}

### RDP
function rdp () {
  & mstsc.exe /w:1400 /h:900  
}  

### Edit HOSTS file
function Edit-HostsFile {
    & notepad.exe 'C:\Windows\System32\Drivers\etc\hosts'
}    
New-Alias hosts Edit-HostsFile


## Import Modules

### z
Import-Module z


## readable strings
# Set-PSReadlineOption -ForegroundColor Cyan -TokenKind String


$ErrorActionPreference = $sav1


