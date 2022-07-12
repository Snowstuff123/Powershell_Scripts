function Set-UserExpiration {
    <#
        .Synopsis
        Sets the AD Account expiration date of provided user.

        .Description
        Sets the AD Account expiration date of provided user. Will cap at 90 days.

        .Parameter Identity
        The samaccount name of the AD Account to be set to expire. ValueFromPipeline=$true.

        .Parameter Date
        Manually provided expiration date. Not mandatory; will default to 90 days if not provided and will cap to 90 days if set greater.

        .Example
        # Set JHeisler to expire in 90 days.
        Set-UserExpiration -Identity JHeisler

        .Example
        # Set JHeisler to expire on 10/23/23.
        Set-UserExpiration -Identity JHeisler -Date 10/23/23

    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [String[]]
        $Identity,

        [Parameter()]
        [ValidateCount(0,1)]
        [String[]]
        $Date
    )

    begin{
        $ExpirationDate = (Get-Date).AddDays(90)
        if ($Date.Length -gt 0) {
            if((Get-Date "$Date") -le $ExpirationDate){
                $ExpirationDate = (Get-Date "$Date")
            }
        }
    }
    Process{
        try {
            $ADUser = Get-ADUser -Identity "$Identity" -ErrorAction Stop
        }
        catch {
            Write-Host $Identity " Not Found." -ForegroundColor Red; Break
        }
        Set-ADAccountExpiration -Identity $ADUser -DateTime "$ExpirationDate"
        Write-Host $ADUser.Name " Expiration Date Set: " (w32tm.exe /ntte ((Get-ADUser -Identity $ADUser -Properties("AccountExpires")).AccountExpires))
        }
    End{
        $Identity = $null
        $Date = $null
        $ADUser = $null
        $ExpirationDate = $null
    }
}

Set-UserExpiration