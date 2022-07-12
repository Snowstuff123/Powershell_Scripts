--- SET-UserExpiration by John Heisler ---
------------------------------------------

VERSION 1.0

AUTHOR hello@JohnJHeisler.com

COMPANYNAME John Heisler

COPYRIGHT 2022 John Heisler. All rights reserved.

TAGS ActiveDirectory AD JohnHeisler

LICENSEURI https://github.com/Snowstuff123/Powershell_Scripts/License

PROJECTURI https://github.com/Snowstuff123/Powershell_Scripts

------------------------------------------

Synopsis
Sets the AD Account expiration date of provided user.

Description
Sets the AD Account expiration date of provided user. Will cap at 90 days.

Parameter Identity
The samaccount name of the AD Account to be set to expire. ValueFromPipeline=$true.

Parameter Date
Manually provided expiration date. Not mandatory; will default to 90 days if not provided and will cap to 90 days if set greater.

Example
Set JHeisler to expire in 90 days.
Set-UserExpiration -Identity JHeisler

Example
Set JHeisler to expire on 10/23/23.
Set-UserExpiration -Identity JHeisler -Date 10/23/23
