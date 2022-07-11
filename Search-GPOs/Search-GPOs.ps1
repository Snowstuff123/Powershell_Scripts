
<#PSScriptInfo

.VERSION 1.0

.GUID 12689a1c-0efb-4a96-831f-35aafbb0917a

.AUTHOR hello@JohnJHeisler.com

.COMPANYNAME John Heisler

.COPYRIGHT 2022 John Heisler. All rights reserved.

.TAGS GroupPolicy GPO JohnHeisler

.LICENSEURI https://github.com/Snowstuff123/Powershell_Scripts/License

.PROJECTURI https://github.com/Snowstuff123/Powershell_Scripts

.ICONURI 

.EXTERNALMODULEDEPENDENCIES grouppolicy

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES
Search-GPOs supports the following features:
A list of strings to search
Choosing the Domain to find GPOs in
Exporting results to a CSV file
Displaying results in PS Gridview

#>

<#

.Synopsis
Search Gorup Policies for a given string.

.Description
Search Gorup Policies for a given string and display results it in a gridview or export it to a CSV.

.Parameter String
The string to search GPOs for. Can be an array.

.Parameter DomainName
Set the Domain Name. Default : $env:USERDNSDOMAIN.

.Parameter OutCSV
Set the CSV path to export Results to.

.Parameter Gridview
Dispaly Results in a Gridview

.Example
# Search GPOs for "FolderRedirect" and dispaly Results in a Gridview.
Search-GPO -String FolderRedirect -Gridview

.Example
# Search GPOs for "FolderRedirect" and export Results to C:\setup\Results.csv.
Search-GPO -String FolderRedirect -OutCSV "C:\setup\Results.csv"

#> 

[CmdletBinding()]
param (
    [Parameter()]
    [string[]]
    $String = (Read-Host -Prompt "String to Search"),

    [Parameter()]
    [string]
    $DomainName = $env:USERDNSDOMAIN,

    [Parameter()]
    [ValidateScript({Test-Path $_})]
    [string]
    $OutCSV,

    [Parameter()]
    [switch]
    $Gridview
)
Begin{
    Import-Module grouppolicy
    
    $result = @()

    Write-Host "Searching for GPOs in $DomainName"
}
Process{
    $allGposInDomain = Get-GPO -All -Domain $DomainName

    Write-Host $('Starting search for ' + $String + '....')

    foreach ($gpo in $allGposInDomain) {
        $report = Get-GPOReport -Guid $gpo.Id -ReportType Xml
        if ($report -match $String) {
            Write-Host "---> Match in: $($gpo.DisplayName) <---" -ForegroundColor Magenta
            $result += [PSCustomObject]@{
                Name = $gpo.DisplayName
                GUID = $gpo.id
                SearchString = $String
            }
        }
        else {
            Write-Host "Nothing in: $($gpo.DisplayName)" -ForegroundColor Green
        }
    }
}
End{
    If($Gridview){
        $result | Out-GridView -ErrorAction Stop
        Write-Host 'Gridview Opened'
    }
    If($OutCSV){
        $result | Export-CSV -Path $OutCSV -NoTypeInformation -Append -ErrorAction Stop
        Write-Host 'CSV Exported'
    }
}