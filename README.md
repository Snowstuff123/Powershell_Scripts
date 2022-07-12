# John Heisler's PowerShell Scripts

![Hero image for John Heisler's PowerShell Scripts](overview/ZenShellHeroImage.png)

[My Website][JHWebLink] | [My Blog][JHBlog] | [Email Me][JHEmail] | [My Socials][JHFindMe]

## About

A collection of PowerShell scripts and tools I've written as part of my day-to-day System Administration duties or for the IT Support Techs I wrok with. Hoping others will find these useful as well.

|                        | Current Tools/Scripts: |                        |
|------------------------|------------------------|------------------------|
| [Search-GPOs](https://github.com/Snowstuff123/Powershell_Scripts/blob/main/Search-GPOs/) | [Set-UserExpiration](https://github.com/Snowstuff123/Powershell_Scripts/blob/main/Set-UserExpiration/) | More Coming Soon! |

## Using these scripts

Make sure the Execution policy will allow you to run the script

### From a PowerShell propmt
- Download the .PS1 file for the script you want to use.
- Put in the filepath followed by the parameters
  - '''Powershell
  <filepath to .PS1> -Param1 -Param2
  '''
## Search-GPOs
Ever needed to search all the Group Policy objects in your domain for a string of text? Look no further!

## Set-UserExpiration
Its basically the Set-ADAccountExpiration with some extra logic. [See the accompanying blog post here](https://www.johnjheisler.net/2022/03/user-accounts-set-to-expire.html)


[JHWebLink]: https://www.johnjheisler.com/
[JHFindMe]: https://www.johnjheisler.com/find-me
[JHBlog]: https://www.johnjheisler.net/
[JHEmail]: mailto:Hello@JohnJHeisler.com
