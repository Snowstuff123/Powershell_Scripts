function Get-ADUserGroups {
    <#
        .Synopsis
        Lists all groups a user is a part of.

        .Description
        Lists all groups a user is a part of.

        .Parameter Identity
        The user to get list of groups.

        .Example
        # Get groups that Jheisler belongs to.
        Get-ADUserGroups -Identity JHeisler
    #>
    [CmdletBinding()]
    param (
        [Alias("User")]
        [String]
        $Identity = (Read-Host "Enter Username of the User")
    )

    try {
        ((Get-ADUser -Identity "$Identity" -Properties "MemberOf").memberof | Get-ADGroup).Name
    }
    catch {Write-Error "Encounterd an Error: $_.Exception"}
}
Get-Help -Name Get-RadGroups -Detailed