# The Matt Taylor Disk Optimizer - TaylorDo 

## Quick Start

#### Status: InProgress
Install the product using default settings. You will need to specify what volume type your disks are; System, Development, Archive and Data are the available types. Mixed drives (or if you are unsure) should be typed as Development. No further action is required... once it's done.
___
## Advanced Users and Admins


### First Time Use
The first time you optimize (a Yearly) will run quietly for up to 50 hours without significantly impacting your performance while it runs. The time depends on several things such as the state of your drive and prior optimizations and your use of the system.

### Optimization Scheduling
The task scheduler will replace Windows Defrag with TaylorDo taks for Yearly, Monthly, Weekly and Daily (mid week) optimization.

The DoTaskOnDemand command will disable all schduled tasks until you issue a DoTasksOnSchedule command is issued. DoTaskReset will recreate the schedule should you need to.

### Customizing Your Zones
#### Prioritizing (ordering) your data
Each volume is divided into up to 20 zones based upon the type or category of information contained therein. Here is the complete list for the Any Complex Volume script:

1. Boot
2. Boot Data
3. Program Hints
4. Program Hints Data
5. Programs
6. Programs Windows
7. Programs Data
8. IDE and Scripts
9. Development and ToDo
10. The MFT
11. The Directories (only)
12. Windows System Files
12. Links and Corporate
13. People and Users
14. Games
16. Shares
17. System Other Data
18. Reference Information
19. Space Hogs (huge items)
20. Archives and Backups

You can change the ordering of zones to match your priorities and individual needs.

#### Changing the contents of a zone

Where you want to change the composition of a zone you will be working in these two directories.

1. **SelectCategory** - This defines what qualifies to be included in the zone. It does NOT include matching items from the zones that preceeded it.
2. **Zones \ ZoneTypeSelect** - This is the more complex select statement(s) that, using SelectCategory, excludes data that belongs in subsequent zones. You are always working with whatever remains and has not already been used in a prior zone.

## Screen Shots
### Before
<img src="Resources/Page/Dev Disk Before 2021-10-24, 18_58_29.png" 
alt="Thumbnail of Matt on YouTube" border="10" />
### In Progress
<img src="Resources/Page/Dev Disk Partial 2021-11-25, 19_12_01.png" 
alt="Thumbnail of Matt on YouTube" border="10" />
### After
<img src="Resources/Page/Dev Disk After 2021-11-26, 23_25_38.png" 
alt="Thumbnail of Matt on YouTube" border="10" />
Success!

[QuickStart]: (QuickStart.md)
[Back to Matt]: (ReadMe.md)
[ImaginaryPage]: (https://TaylorDo.github.io/folder/Index.md)
===================================================
