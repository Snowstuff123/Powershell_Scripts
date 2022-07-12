--- SEARCH-GPOs by John Heisler ---
-----------------------------------

VERSION 1.0

AUTHOR hello@JohnJHeisler.com

COMPANYNAME John Heisler

COPYRIGHT 2022 John Heisler. All rights reserved.

TAGS GroupPolicy GPO JohnHeisler

LICENSEURI https://github.com/Snowstuff123/Powershell_Scripts/License

PROJECTURI https://github.com/Snowstuff123/Powershell_Scripts

RELEASENOTES
Search-GPOs supports the following features:
A list of strings to search
Choosing the Domain to find GPOs in
Exporting results to a CSV file
Displaying results in PS Gridview

-----------------------------------

Synopsis
Search Gorup Policies for a given string.

Description
Search Gorup Policies for a given string and display results it in a gridview or export it to a CSV.

Parameter > String
The string to search GPOs for. Can be an array.

Parameter > DomainName
Set the Domain Name. Default : $env:USERDNSDOMAIN.

Parameter > OutCSV
Set the CSV path to export Results to.

Parameter > Gridview
Dispaly Results in a Gridview

Example 1
Search GPOs for "FolderRedirect" and dispaly Results in a Gridview.
Search-GPOs -String FolderRedirect -Gridview

Example 2
Search GPOs for "FolderRedirect" and export Results to C:\setup\Results.csv.
Search-GPOs -String FolderRedirect -OutCSV "C:\setup\Results.csv"
