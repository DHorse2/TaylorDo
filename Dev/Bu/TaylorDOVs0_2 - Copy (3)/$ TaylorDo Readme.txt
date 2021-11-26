
# TODO:

/* ---------------------------------------------------------- */
# GAPS
	# TEST (FAILED!!!) NO BOOLEAN LOGIC AVAILABLE.
	SetVariable(FlagDoNotVacate, 0)
 
/* ---------------------------------------------------------- */
# Note: 
#   Don't bother with DefragBasicVolume unless the Volume only
#     has one type of data. Even so, it is better to use the Data or
#     Archive Volume Types which are designed for this.
#   The reason for this is if there happens to be specialized folders
#     or file types within various categories that DO improve performance
#     then they will by default be in an optimal location.
#	FYI (tech.) DefragBasicVolume was an Agile/Rad dev stage.
#		It was simplified in nature, spawned for the original
#			sample scripts and provided a foundation to layer the
#			(project central) components on top of.
#		Quite a bit of experimentation had to occur to create the
#			Zone components and Zone building components in the
#			form they exist as of release.
#		Note: I should have introduced advanced Pausing features
#			(I had basic ones) at the beginning of the dev cycle
#			instead of the end. I would have helped me as I am
#           sure it will help you.

/* ---------------------------------------------------------- */
# Os PageFile, Hybernation and Memory Dump (diagnostic) file.

/* ---------------------------------------------------------- */
# Safe Mode required and UNKNOWN pagefile fix to move them
# to the right zone. 

# Except that Hyberfile move causes corruption.

/* ---------------------------------------------------------- */
/* SetVariable(FileStepDescription,"FreeUsed Vol: !VolumeFreePerUsed!% Zone: !ZoneFreePerUsed!%") */
/* SetVariable(FileStepDescription,"Used: !VolumeUsedTotal! !VolumeUsedPer!%") */

/* ---------------------------------------------------------- */
ImportListFromFile

/* ---------------------------------------------------------- */
# GOTCHA:
/* ---------------------------------------------------------- */
1) Re Scope:
	Out of Volume and Zone side effects on variables used in logs/display. 
	(zone size 0.)
	Volume stats exist after Volume Action and go out of scope at end.
	Zone stats exist after File Action and go out of scope at zone end.
	
/* ---------------------------------------------------------- */
8) XincludeX Cyclical references.
	Comments process includes.
	Including cyclical references which crash the script run time.

/* ---------------------------------------------------------- */
2) Weird preprocessing (duplicate) of display variables. 
	Does a Volume prepass thru zone code.

/* ---------------------------------------------------------- */
3) Issues with precision and display require care.

/* ---------------------------------------------------------- */
4) Agile / Rad dev. methods are essential with include based scripting.
	IE Make small changes and test them before proceeding.

/* ---------------------------------------------------------- */
5) Yes, defrag SSD drives but only one per month. Set up script.

/* ---------------------------------------------------------- */
6) What's up with logs?
	I will be do some HelloWorld.Log tests when I have the time.
	20211106 - Hello World test passed.
	Log is not written on exit either.
	Work around: uggg.
	Therefore! Your only current option is to copy the text
		from the Statistics View when you need to do analysis.
		You can make use of the Pause features if you want to
		stop at a particular Zone and prevent any bad effects
		that follow it.

/* ---------------------------------------------------------- */
7) Create Bat's for certain settings (Like Sys = C:)

Good to set:
Last Access Date (Registry)
Schedule Tasks (Task Scheduler)

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* ---------------------------------------------------------- */
# DOCUMENT:
/* ---------------------------------------------------------- */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
Dedication: To Matt Taylor, a dedicated teacher always willing
to spend time with his students.

MYDEFRAG SCRIPTS FOR THE TOO BUSY. 
Subtitle: MyDefrag Scripts for busy, non-technical folk.
While the product is intended as a tool for managing small networks
it is powerful enough to create a default configuration that is 
optimized for almost all use cases.

License: This is free and open source to be used in any way you wish.
Commercial use is fine but the MyDefrag software has it's own lisence.
MyDefrag requires that the entire application is included where any
part is used or distributed. Note that it includes a few sample scripts
to get you started.

/* -------------------------- */
Why create this project? 

This is based on many years of fragmentation frustrations.
Windows does a terrible job of disk management and a basic
examination reveals the disks are not truly optimized in any
fine grained sense of the word.

I had to abandon the project on a few occasions because it was
so extremely time consuming and involved endless test runs for
tuning. Having needed to finish it I will be sharing it along
with some other projects as they progress. Enjoy.

/* -------------------------- */
DISCLAIMER: Damn it Jim! I am a software developer not a
disk technician. Someone with more skills should review this.

/* -------------------------- */
Sisters and brothers... friends... I need:

a) Disk technical expertise.
b) Beta Testers.
c) Review of the File Extensions.
d) Cleaner documentation... a manual?
e) Before and after system performance data.
f) Peace, freedom and democracy in that Order.

/* -------------------------- */
QUALIFICATIONS: I am a code file include block and scripting
pioneer, expert and Guru.
I started programming professionally in 1978. Yup...

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
The library - Summary (Executive overview):

MYDEFRAG SCRIPTS FOR THE TOO BUSY.

Versions: 	0.1.0 Beta GitHub release.
			0.?.5 Turn On / Turn Off (soon).
			0.0.4 (Current) Isolated Zones.
			0.0.3 Enhanced Gaps & many added (isolated) components.
			0.0.2 TooBusy Original Method, code review & testing.
			0.0.1 Mdm Dev advanced Zone Layout & Evals. ('17 & prev.)

Author: David G. Horsman
Contact info: 
Email: David_Horsman@Hotmail.com
Phone: (587) 889-9967
Dates: 2018-2019
Location: Calgary, Canada

MyDefrag.
Author: ???

PkDefrag.
Author: ???

/* -------------------------- */
Description:
Monthly and Daily Scripts for the open source product MyDefrag.
These are self adjusting based upon the size and amount of disk used.
There are a few settings but they should work without alteration.
This means for personal computers, home networks, small developers 
and small business networks or LANs.

This is a FOSS product for non-system administrators, small business
(LANs) and regular people/home use. It is a vastly superior solution
to both default Windows defraging and other free solution out there.
The reason for this is that it has very (easy) fine grained control 
over data and setting definitions well very effeciently implementing
the principals espoused and advocated by these authorities. Without
wearing out your disk drives. Awesome.

/* -------------------------- */
For larger more complex users:
That said, this is a component library for a include based script language.
It can scale up to handle networks of any size for small business.
I do not know the maximum size of the scripts (which really blow up when
expanded, but I believe you would only be limited by script size and memory.

There is no better open source product available. They all tend to be
default driven and overly simplistic or in this case so complex you
need extensive training and actual experience with it to master it.

Lots of people have the skills but it the product didn't come with
adequate default scripts (or components) to quickly build a custom
library for any given installation.

A final comment, this was not created for the MyDefrage product and
will be ported to a fully open source basis after further technical
evaluation. Or... in other words... I gotta go do some real work.

Please enjoy this, dont be too busy and contact me if you need
(free support) help and support (within limits, writing your scripts
would be beyond them.) Don't worry, be happy.

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
Let me know if this meets your needs or not. David_Horsman@Hotmail.com
Fell free to contact me. Here's the need to know:
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
Summary:
/* xxxxxxxxxxxxxxxxxxxxxx */
TL;DR (Too long; Didn't read.):
Use the Monthly runs and just set your volume labels.

Read the must read that follows.

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
TL;MR (read this. Too long; Must read.):

THE SYSTEM FOLDER NAMES ARE FOR WINDOWS NOT LINUX!!!

Obviously you can change that quite easily.
I will get to it when implement the Whonix and Debian systems.

Description:
MyDefrag is an awesome enhancement to the open source original ???
and works really well. As often happens, the SUPER CRITICAL stuff
to know is in the documentation but the default scripts provided
for your use do not have these options included at appropriate
defaults. Unlike Windows, as growth (self) adjusting algorithm 
with said defaults using the familar "Settings" paradigm for
more technical people. This script library is it.

EVERYONE: Observing the results will teach you about your disk usage and
organization and provide the needed information to adjust the
gaps if you are technical.

Reflecting the real world, there are disk types such as system,
Data, Archive and Dev. Use Dev where the disk contains a mix of
all types of data including archives.

The "MyDs" file types contain the standard folder names
for different types of data. Backup but it is easy to modify them
to use whatever folder names you do.

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
What is a Volume Type?
/* xxxxxxxxxxxxxxxxxxxxxx */
What's a disk (Volume) Type? What it sound like basically.

You MUST have a system disk (Sys) because all systems do.
By gosh you don't even have another disk. Awesome.

That being the case, (most often) the System defrag is the only 
script you have to worry about. That is type "Sys".

/* xxxxxxxxxxxxxxxxxxxxxx */
/* IMPORTANT */
The first time you run this:
/* xxxxxxxxxxxxxxxxxxxxxx */
Click "DefragSystemDiskYearly.MyD" in the Yearly Scripts folder.
Run this every night, if your system is slow kill it in the morning.
Keep doing this until it finishes successfully by morning.

Every month hopefully, run DefragSystemDiskMonthly in the Monthly Scripts folder 
(I prefer before month end processing to speed it up.)

If you like, every day run DefragSystemDiskDaily in the Daily Scripts folder. 
(It isn't terribly important when you miss this.) 

/* xxxxxxxxxxxxxxxxxxxxxx */
There may be more disks. No biggie...

Here are the Volume Types (categories) (of disks) handled:
Sys        Your Operating System
Dev        ALL PURPOSE. (Software Development.)

Currently just running the "Dev" layout:
Data       Your data disk like photos, musis, videos, whatever.
Archive    Archives and backups.

/* xxxxxxxxxxxxxxxxxxxxxx */
You can make other scripts yourself.

DefragSysDiskDaily.MyD
DefragSysDiskMonthly.MyD
DefragSysDiskYearly.MyD

Per the standard MyDefrag installation, these are RUNNABLE scripts
(not the little snippets used for selection or as components.)

Have a look at a few and creating a custom one for your specific
disks is fairly easy.

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
FIRST TIME LONG RUN TIMES.

WARNING: A first time run can exceed 24 hours depending on just
how badly organized your disk is (but this is consistent regardless.)
You can run it over night and kill it with the task manager.
You can then restart it at the next end of day, it will scan back
to the correct point in about 5 - 20 minutes and resume. Yipee!

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
IMPORTANT SETTING YOU SHOULD USE: 
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */

First, there is two script variables you should set in "SettingsYoursGlobal.MyDc".

/* xxxxxxxxxxxxxxxxxxxxxx */
1) MftPer - MFT location X% into the Volume. 

It is the MftPer setting or MFT relative % location in Volume Used. 
(IE. C: Drive.)

There are optional ones, for example, MftPerData is specific 
to the Data Volume (Type). 

/* xxxxxxxxxxxxxxxxxxxxxx */
2) OsPer - Percentage of Volume Use by the OS (Operating System.) 

/* xxxxxxxxxxxxxxxxxxxxxx */
Other stuff:
/* xxxxxxxxxxxxxxxxxxxxxx */
3) IF YOU HAVE A DATABASE SET (Check) THE FILE EXTENSIONS 
in "Databases.MyDs".

/* xxxxxxxxxxxxxxxxxxxxxx */
4) Note there is a Daily run and a Monthly run by Volume Type.

/* xxxxxxxxxxxxxxxxxxxxxx */
5) Task Scheduler.
(Automatic over night runs. Hands free operations.)

If you know how set up your task scheduler to run these two
and get rid of any daily/monthly run for the Windows Defrager.

<ComputerManagement><TaskManager>...look for defragging tasks.
Add two new ones. One for the daily run and the other monthly.
Warning: It is fairly technical to add tasks to the scheduler. 

End of list.

So... that was the short version... Do continue reading...

Or... just enjoy. 

End of short version. 
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
ADDITIONAL INSTRUCTIONS AND DOCUMENTATION/NOTES
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */

~TL;WR: (Too long; Will read anyway because I am altering scripts.)

FileName for runable Scripts:
ScriptName.MyD

ScriptName:
Defrag[DiskType]Disk[Frequency].Myd

However you will notice they file extensions:

MyD (A script you can execute)
MyDc (A script component used in those scripts)
MyDs (A script component for selecting files)


Most of the notes are in the scripts themselves but generally reflects how (as software developers and users) our PC network disk drives were 
organized over the years.

I advocate for as much standard user interface and OS (Windows) conventions as possible and this is reflected in the Volume and Folder 
naming.

Each of the zones represents a category of files when included with the ".MyDs" selection components.

/* xxxxxxxxxxxxxxxxxxxxxx */
Volume Management Strategies:

1) Standard. (The default.)
2) Fixed by Zone.
3) Relative to the Os Zone.

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
ALL BASED UPON FAMILAR USER INTERFACE STANDARDS AND PRACTICES.

Industry Standard Standards.
Over the years I have tried to mold our system configurations
and tools to "Standard" Windows and Web UI's and functionality.
It greatly benefits the user when the standards are based upon
familar practices and existing disk / windows (or linux) folder
structures.

/* xxxxxxxxxxxxxxxxxxxxxx */
Computer Maintenance Methodology and key concepts:
/* xxxxxxxxxxxxxxxxxxxxxx */
1. Human readable folder contents and navigation.
2. SOLID principals for data.
3. Ownership and security location of data.
4. Root folder sizing appropriate to backup and volume media sizes.
5. Folders are generally Topics, subjects, tasks, entities.
	Always keep this in mind. It is foundational and standard practice.
6. Extensive use of shortcuts and links to:
		Point the flat link to the deep structure.
		Follow the path back & forth between deep and root folders.
		Add links to folders related to a folder.
7. BROKEN SHORTCUTS. This is a HUGE issue for most non-enterprise
		users. It applies to when you copy or backup data and
		move it to another system or volume. 
			a) The shortcuts no longer work.
			b) Windows destroys them if you happen to
				click on a bad one.
		There used to be a fixit utility (Windows repair) that did
			more than just delete broken links. It gave you a drop
			down menu of possible solution that were quite good.
			It accurately matched the SW requirements except it did
			not have any extended logic for doing batch repairs.
			
		I have a archaic shortcut repair tool that worked really well.
			It prepared very intellegent repair suggestions.
			It did not work in batch mode per se due to the
				complexity and need to verify many repairs.
			However it did a good job of group link repairs together
				so that the links could quickly be fixed via a
				run and review by the user.

Flat AND Deep Folder Structure.
Generally a flat folder structure is better. By this I mean it
should exist to aid the user in system navigation. Traditionally,
people use Favorites or Links folders. This allows a very deep,
highly organized folder structure to exist within OS limits.

Large folders, long paths and easy backup.
When subfolder become too large or the directory structure (path)
becomes too deep these can be moved to the root
or an expansion / extension folder in the root (IE "?:\Ext\???")

Massive folders go into the root directory regardless and are 
linked to the deep structure. These same links are repeated
in the flat Links structure the user uses (IE "Favorites".)

Bookmarks are flat.
This flat structure is what browser bookmarks are and it is a
popular and familar way to work. AT A LATER DATE, I will create
a current utility to sync browser bookmarks with the system
folder structure.

Future and Past Sychronization.
I have a utility that synchronized MS Outlook MAPI folder
structure and items to disk. This is a highly productive paradigm
but requires more explanation that space allows here.

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
Regarding all those "???.MyDs" file selection script snippets?

Why yes, this strategy accommodates a wider Small System Best Practices
developed over the years for micro business and person/family clients.
This has a particular focus on careful disk folder organization that
reflects the user's computer use.

I will publish the notes or draft related to that when I get time.

To continue, Folder Naming Conventions are important! :

My standard folder naming convention for software development
folders which of course you should modify the "MyDs" selection
script to reflect the naming convention you have in use at your
organization in your part of the world... (had to make that
sentence a little longer...)

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
(Extracted programmers notes here now:)

/* What you need to set: */
/* The MFT relative location */
/* The minimum No of Files and Bytes to qualify for resorting */
/* Your Sys and Dev Volume Names */
/* The name and location of your log files. */
/* Maybe things like ProcessPriority, ExitIfTimeout... you decide. */
/* Scheduling, use and workload determine ProcessPriority. */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* PROBLEMS: */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* Note: I cannot fix these issues without the source code obviously. */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* CRASHES: */ 

/* xxxxxxxxxxxxxxxxxxxxxx */
/* CRASH 1 - RANDOM (damage free): I have seen it crash a few times but it has never */
/* done damage in numerous years of use. */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* CRASH 2 - OUT OF FREE SPACE: Space between zones is based on the a percentage */
/* of the volume used and ends of being proportional because of this. */
/* . */
/* However, space used is a very dynamic variable. When it comes to */
/* disk space and zones in particular, we only want to move them in an */
/* orderly stepped manner as they grow or shrink. */
/* So we round up to a percentage of the total disk space which is always */
/* a fixed predictable value for any given volume. */
/* Space hog files want to round up to a large % so it is moved rarely. */
/* . */
/* xxxxxxxxxxxxxxxxxxxxxx */
/* The CRASH? It appears to happen whenever you gap the disk beyond the */
/* available free space. I am concerned that this rounding up by whole disk */
/* percentages could consume all the free space and cause a crash. */
/* . */
/* xxxxxxxxxxxxxxxxxxxxxx */
/* IMPORTANT: In the event the defrag crashes on the last few zones AND your disk is full */
/* you can adjust the default growth rounding for the system and relative free space */
/* in SettingGet. */
/* The two sets of adjustments are: */

/* VolumeRoundUp (Tiny, Small, Medium, Large, ExtraLarge and BlobBu.)
/* VolumeAdjRoundUp (the same. Adj as in Adjusted Free Space.)

/* This avoids your having to hack around in the other scripts if you encounter a problem. */
/* Pretty well everything that you can adjust to good effect is available in SettingGet. */
/* If you happen to be a DBA or hardware buff you can go through the scripts and tweak the spacing. */
/* If you do, send me a note. */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* CRASH 3 - UI Hang at Start: Whenever the MFT or Directories are being repositioned or sorted */
/* the system can slow down or the UI hang. */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* BUGS: */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* BUG 1 - LOGS: You do not get partial logs on aborted, paniced or crashed runs */
/* This makes debugging very difficult. */
/* I am assuming they will work and look awesome... */

/* BUG 1 - LOGS: You do not get partial logs on aborted, paniced or crashed runs */
/* This makes debugging very difficult. */
/* I am assuming they will work and look awesome... */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* BUG 2 - Current Run Time does not work in Title. */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* Bug 3 - There is no way to Gap based on current zone size. (Bad.) */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* Bug 4 - If you exit from MyDefrag using the menu it continues running in the background. */
/* You must use the Task Manager to kill it. */
/* It appears to affect both the system generally and running a subsequent defrag as well. */
/* Do not be fooled by it's claims about killing already running instances. */
/* This apparent attempt at a fix (ie a singleton) did not work. */
End of list.

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* Future Enhancements: */

/* 1) Add Zone stats to the Logs. [InProgress] */

/* 2) Add Linux System Files .MyDs Selection scripts (Linux High and Sys Low.) */

/* 3) Finish the Gap Methods for the non-standard methods. Mft, Os, Original.) */

/* 4) Figure out why logging doesn't work. [InProgress] */

/* 5) This is for porting and use on a true FOSS product (having scripts.) */

/* 6) Release, modernize and integrate my shortcut repair utility. */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* Re SCIPT MODIFICATIONS MODS:
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */

/* Tip: Before you continue: */
/* You might jump to the bottom first and look at the */
/* variables and settings used within this and the */
/* MyDefrag library. It is sort of self explanatory. */ 

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
REALLY IMPORTANT!:
/* xxxxxxxxxxxxxxxxxxxxxx */
DO NOT ALTER "SettingsDaultSet.MyDc". It is REALLY easy to make a
mistake and rather confused about what changes cause what effects.
(Speaking for myself anyway.) Therefore, any changes you want to
make to settings go into the files named "SettingsYours[???].MyDc.

This will override any default setting the system made at start up.
However! The setting remains as you set it (it's scope is global.)
Each Volume and Zone will subsequently alter settings and values
related to that script section.

Repeat... DO NOT DO IT! DO NOT ALTER "SettingsDaultSet.MyDc".

If you plan to alter the default settings you can override them
in the five individual files provided for "Settings - Yours"

/* xxxxxxxxxxxxxxxxxxxxxx */
Global settings here:

SettingsYoursAll.MyDc

and settings by Volume Type here:
 
SettingsYoursSys.MyDc 
SettingsYoursDev.MyDc 
SettingsYoursArchive.MyDc 
SettingsYoursData.MyDc 

/* xxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxx */

/* DEBUGGING */
/* IS NOW AVAILABLE! */

/* (GOTCHAS below too) */
/* xxxxxxxxxxxxxxxxxxxxxx */

/* REALLY IMPORTANT!: */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 1) GAP COMMAND DoNotVacate Option.
 
/* The "GapCommand.MyDc" component allows you to remove the */
/* DoNotVacate option so that you can see where each zone */
/* begins and ends so that you can debug during the early */
/* part of the run. This is quite useful when a script */
/* error causes the gaps to malfunction. */

/* 1a) GOTCHA: Gap error due to skp modifications. */

/* CAUSE: Bad side effects occur if a programming error */
/* causes the Gap to become zero or zone locations on the */
/* volume to go whacky. */

/* IMPORTANT: Repairing this properly requires using the */
/* Yearly defrag option for performance (head movement) reasons. */
/* Large (already sorted) chunks can be left in the (very) wrong */
/* location on disk. */

/* EFFECT: You can end with the dreaded DATA BLOB where one end or the */
/* other of the disk is completely packed with the data from */
/* zones (often overlayed.) With zero free space there is huge */
/* head movement to shuffle things back to their correct locations. */

/* Variant 1: If the zones pack to the end of the disk? */
/* For example, if your free space % assignments are too high. */
/* This can fix itself quite quickly as it moves the data down */
/* into free space. */

/* Variant 2: If the zones pack together at the beginning of the disk? */
/* For example, your scripting error made all or some gaps zero */
/* or pointing at the start of the volume (Mft error.) */
/* This is a very long repair run because (for one) there is */
/* no (close) free space. For two, data has to be moved out of the */
/* way (up WAY high on disk) to put the zone back in the correct place. */
/* So lots of disk thrashed. */

/* HOW BAD? Performance wise, this is slow in the same way that a first time */
/* or yearly run can take a very long time. Clearly this slows the */
/* development effort or testing process. */

/* ADVICE: Generally, completely unattendend testing becomes tempting but */
/* perhaps inadvisable. Keeping an eye on the run (always) while */
/* you perform other work is highly adivisable. */

/* Avoid my painful lesson my friends... be wise in all things. */

/* Example story of this: */
/* Huh? What happens is we noobs and non disk techies might: */ 
		/* Make an error in a working script. */
		/* Return later to see a massive blog of filled disk at the end. */
		/* (BLOBS of filled disk are bad and may look random!) */
		/* Then be unable to see the effects of subsequent fix runs. */
		/* Requiring the need to attend what now could be a long run. */
		/* . */
		/* By turning off the DoNotVacate Option each zone sequentially */
			/* adds its gap after processing. This is highly visible. */
			/* It will make the normal stripes of vacant space show. */
		/* . */
		/* Note: In the event no gaps are showing after a few zones this */
			/* indicates your mod is causing the Gap to be zero. */
		/* Therefore, the best (normal) method of starting a defrag run */
			/* and checking on it periodically can used. */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 1a) DEBUG MESSAGES. 
		/* You can now set DebugMessage and include "DebugDisplay[Pause[Amt]].MyDc.

		/* Example: */
			# XXX EXAMPLE: Debugging. Use of DebugMessage to troubleshoot Gap Calculation.
			SetVariable(DebugMessage, "GAP:Req !GapRequested!Rnd !GapRounded!Adj +++
							!GapAdjusted!Ava !GapAvailable!Cur !GapCurrent!Act !GapActual!")
			So:
			SetVariable(DebugPauseAmt, 15)
			!include "..\DebugDisplayPauseAmt.MyDc"!
			or just:
			!include "..\DebugDisplay.MyDc"!

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 1b) PAUSING: You can put a "pause()" anywhere you like and it will ask you to hit <spacebar>. */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 1c) Re pausing, two convienience one line scripts are there to handle obvious pause locations:
			SettingsPauseVolume
			SettingsPauseZone

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 2) Debug Tip: Re Volume and ZoneAdjust */
/* xxxxxxxxxxxxxxxxxxxxxx */

/* Either is a multiplier for rounding, so you can set it to 1 and */
/* round to the nearest 1 to neutralize that setting where this might help. */

/* Generally, low values are for really full disks to avoid packing the top */
/* of the volume due to rounding upward (which keeps things stable.) */
/* EI. This prevents unnecessary or unwanted gaps on disk particularly when full. */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* Note Re: Mft Method */
/* IN PROGRESS */
/* xxxxxxxxxxxxxxxxxxxxxx */
/* This refers to the spot where you want to push all files above the MFT! */
/* but they are no doubt high performance needs files */
/* (being just above the MFT and directories implies you want fast access.) */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 3) Note INCLUDES: the simple design pattern using included text components. */
/* xxxxxxxxxxxxxxxxxxxxxx */
/* INCLUDE BASED paradigms are fairly poweful and old school. */
/* Include based files processing is absent from most IDE platforms. */

/* Discussion:
/* The reason for this is that the equivalent paradigm is */
/* ATTRIBUTE BASED code features in the language or IDE. */
/* Also MACRO BASED code features are another approach. */
/* All of these can be present and IMO should be. */
/* However (as always,) you obviously do not want to distort */
/* line numbers unless you are going to show the nesting or */
/* stack or enough source code or all of em. */

/* Poor mans OO. The include program code source paradigm. Lol. */
/* BTW. This is normally handled by attributes in programming where */
/* the source code is preprocessed and (typically robust) substitutions */
/* are made. Includes are old school and an awesome feature for any language. */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 4) In particular, ERROR LINE NUMBERS are the line number */
/* xxxxxxxxxxxxxxxxxxxxxx */
/* including all "include" text. You have to add up document lengths */
/* to get the correct line number and document. */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 5) LOCATING ERROR LINE NUMBERS is like a B-Tree search technique. */
/* xxxxxxxxxxxxxxxxxxxxxx */
/* You introduce a syntax error midway in a block of code and if: */
/*		The syntax error is before that it remains unchanged. */
/* 			Repeat this process on the block of code above this point. */	
/*		The syntax error is below your change will display a new error. */
/*			The line number tells you a relative location of the original error. */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */

/* MORE IMPORTANT TIPS: */ 

/* xxxxxxxxxxxxxxxxxxxxxx */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 1) LOCATE LINE NUMBER: */
/* xxxxxxxxxxxxxxxxxxxxxx */
/* By adding obvious syntax errors above where the error occurred */
/* you can quickly narrow down which line is the problem. */  

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 2) ADD DISPLAY AND LOG INFO: */ 
/* xxxxxxxxxxxxxxxxxxxxxx */
/* The other settings below (in SettingsGet) are mainly to demonstrate how */
/* They help make your log file look pretty and impress the boss. */
/* Your cat doesn't care and you should stop feeding it. */
/* Our previous systems were managed using a simple system. */
/* This helps to understand the Zones as categories I hope. */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 3) SET YOUR VOLUMES!!! */
/* xxxxxxxxxxxxxxxxxxxxxx */
/* Be sure to set the name of your volumes or drive letters */
/* Examples: */
/* SetVariable(VolumeSys,"BobsDisk") */
/* SetVariable(VolumeData,"MusicDisk") */
/* SetVariable(VolumeData,"F:") */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 4) Note: ARCHIVES and BACKUPS: */
/* xxxxxxxxxxxxxxxxxxxxxx */
/* Volume Dev is designed to include Data, */
/* Backups (Bu*) and Archives (Archive*). */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 5) Misc: */ 
/* xxxxxxxxxxxxxxxxxxxxxx */
/* SetVariable(ScriptDir,"\\!Server!\!Volume!\Ide\MyDefrag\MyDefrag\MdmScriptMyDefragVs4_3_1\") */
/* "E:\Ide\MyDefrag\MyDefrag\MdmScriptMyDefragVs4_3_1\" */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 6) MFT: */
/* xxxxxxxxxxxxxxxxxxxxxx */
/* You set your MFT percentage based on the size of your executable code base */
/* As of 20190618 40% leaves a lot of black space below the MFT. */
/* . */
/* However a large number of downloads and installs are underway */
/* (Probably) most of these should be on the system drive. */
/* . */
/* The point being that on a dev system with 3 development stacks */
/* a lot of that empty space would be used up. */
/* . */
/* And what of the SDK libs and data? What became of them? */
/* Where did they go... or will go... */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 7) Limiting run time, disk thrashing/wear issues and performance: */

/* REALLY IMPORTANT: SKIP BLOCK: */

/* xxxxxxxxxxxxxxxxxxxxxx */

/* Extracted MyDefrag Help Documentation: */
/* SortByName - SkipBlock */
/* Syntax: SkipBlock(NUMBER , NUMBER) */ 

/* This option will look for blocks of items that are already sorted, and will skip those blocks. */ 
/* The first NUMBER argment is the minimum number of files in a block, for the block to be skipped. */ 
/* The second NUMBER argument is the minimum number of bytes that a block has to occupy for the block to be skipped. */ 
/* The two arguments are logically AND'ed, in words: the block must have at least argument1 files AND at least argument2 bytes. */ 

/* Discussion: */
/* So there is no point having (observed) your disk */
/* MADLY THRASHING AWAY to resort groups of files that have only */
/* had minor changes occur in their Last Access Date ordering. This wears out the disk and is very slow. */
/* Yearly: Should only be done once per year where this is turn off. A complete resort. */
/* Monthly values are more inclusive where perhaps a resort is done or mainly done and */
/* Daily values should just clean up the disk a bit. */
/* Sound good? Tweak it maybe?*/

/* xxxxxxxxxxxxxxxxxxxxxx */
/* 8) ALSO IMPORTANT: BLOBS: */
/* xxxxxxxxxxxxxxxxxxxxxx */
/*  Your BlobFileSize is also found in settings and is a rather small 10MB by default. */
/* Database, dll, exe and (Outlook) pst files are automatically excluded.

End of list. 
END OF DEBUG

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* Design Rationale & DISCUSSION */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* Regarding all volumes including the DefragSystemZones.MyDc Script.

/* It happens that having more of your (fast) free space available on working and */
/* development has advantages (below.) In the case of Archives and Data Volumes */
/* it is my view that incoming and new data benefits for the same reasons. */

/* So on a system disk the boot and system get lots of fast disk. */
/* On other Volumes this also applies but the free space is placed for */
/* performance with the remaining data prioritized by category. */  

  /* Note: The general formula for spacing of disks works in a very simplistic way. */
  /* On a Sys(tem) Volume this area is quite large relative to the placement of the MFT. */
  /* However, on all other non-system disks each of these sections can be very small */
  /* . */
  /* So... Non-system disks have several bands of free space. This is at very fast */
  /* part of the disk. Fact. All new files and expansion of files is placed in this */
  /* part of the drive, which is where you want them. They are new right? */
  /* . */
  /* At the end of the day they are placed in their appropriate zones. */
  /* If you only defrag once a week or per month this is not a disadvantage. */
  /* Probably better on system drives but definitely neutral. */
End.  
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* OTHER COMMENTS
/* xxxxxxxxxxxxxxxxxxxxxx */
/* Re BLOBS: */
	  /* These are not considered BLOBS. That is file size dependent */
      /* For audio and video space hogs go by size instead (bigger than 10MB) */
      /* or FileName("*.avi") */
      /* or FileName("*.mp3") */
      /* or FileName("*.mp4") */
      /* or FileName("*.wav") */
      
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* Re FEATURES THAT DIDN'T WORK AS EXPECTED: LOGS: */
/* xxxxxxxxxxxxxxxxxxxxxx */
/* Debugging */
/* Attempts to get the log file working... sigh... */
/* Show the MyDefrag logfile. */
/* RunProgram("E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe",' -vm "C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe"','"!MdmLogFileName!"')" */

/* xxxxxxxxxxxxxxxxxxxxxx */
/* Failed attempts: Grrrr.... */
/* SetVariable(MdmTest,"E:\Test.txt") */
/* RunProgram('E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe','-vm ','C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe','--launcher.openFile ','E:\Test.txt') */
/* RunProgram("E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe -vm 'C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe' 'E:\Test.txt'") */
/* RunProgram("E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe -vm 'C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe' --launcher.openFile 'E:\Test.txt'") */
/* RunProgram('"E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe" -vm "C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe" --launcher.openFile "E:\Test.txt"') */
/* RunProgram("E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe") Opened program */
/* RunProgram("E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe", "E:\Test.txt") */
/* RunProgram('E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe','-vm "C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe"','--launcher.openFile','E:\Test.txt') */
/* RunProgram("E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe",'-vm','"C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe"','"E:\Test.txt"') */
/* RunProgram("E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe",'-vm "C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe"','--launcher.openFile "E:\Test.txt"') */
/* RunProgram("E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe",'--launcher.openFile','"E:\Test.txt"') */
/* RunProgram("E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe",'--launcher.openFile "E:\Test.txt"',' -vm "C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe"') */
/* RunProgram("E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe",' -vm "C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe"',' --launcher.openFile "E:\Test.txt"') */
/* RunProgram("E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe",'-vm','"C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe"','--launcher.openFile','"E:\Test.txt"') */
/* RunProgram('"E:\Ide\Eclipse\EclStdVs4_2_1_32b\eclipse\eclipse.exe" -vm "C:\Program Files\Java\jdk1.6.0_45\jre\bin\javaw.exe" "E:\Test.txt"') */
End of list.

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* Sample (ALL) settings & commands in use */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */

# Run
	ProcessPriority(Normal)
	ExitIfTimeout(180) // default 120.
	RunProgram("..\pskill.exe", "-t MyDefrag.exe")
	Pause(10)
	OtherInstances(exit)
	StatusBar(Status Path MouseOver)
	SetVariable(DebugMessage,"empty")

# Script
	SetVariable(ScriptDir,"..\")
	
# Volume
	SetVariable(VolumeNamePrefix,"Mdm")
	SetVariable(ServerName,"Pc15")
	SetVariable(ServerNameFull,"!VolumeNamePrefix!!ServerName!")
	
	SetVariable(VolumeSys,"!VolumeNamePrefix!Sys")
	SetVariable(VolumeDev,"!VolumeNamePrefix!Dev")
	SetVariable(VolumeData,"!VolumeNamePrefix!Data")
	SetVariable(VolumeArchive,"!VolumeNamePrefix!Archive")
	SetVariable(VolumeCurrent,"NotSet")

# Zone
	SetVariable(ZoneCurrent, "0")
	SetVariable(ZoneCurrentDescription, "NotSet")

	SetVariable(MftPer,0.30)
	SetVariable(MftRoundUp, "!VolumeRoundUpLarge!")
	SetVariable(MftAdjRoundUp, "!VolumeRoundUpLarge!")

	SetVariable(ZoneGap, GapCurrent)
	SetVariable(ZoneBeginCurrent, ZoneBegin)
	SetVariable(ZoneEndCurrent, ZoneEnd)
	SetVariable(ZoneSizeCurrent, ZoneSize)

# Mft
	SetVariable(MftPerSys,0.35)
	SetVariable(MftPerDev,0.10)
	SetVariable(MftPerData,0.35)
	SetVariable(MftPerArchive,0.10)

# Rounding
	SetVariable(VolumeFreeAdj, 1) */
  
	SetVariable(VolumeRoundUpTiny, 0.01)
	SetVariable(VolumeRoundUpSmall, 0.03)
	SetVariable(VolumeRoundUpMedium, 0.05)
	SetVariable(VolumeRoundUpLarge, 0.10)
	SetVariable(VolumeRoundUpExtraLarge, 0.15)
	SetVariable(VolumeRoundUpBlogBu, 0.10)
	
	SetVariable(VolumeAdjRoundUpTiny, 0.005)
	SetVariable(VolumeAdjRoundUpSmall, 0.01)
	SetVariable(VolumeAdjRoundUpMedium, 0.03)
	SetVariable(VolumeAdjRoundUpLarge, 0.05)
	SetVariable(VolumeAdjRoundUpExtraLarge, 0.10)
	SetVariable(VolumeAdjRoundUpBlobBu, 0.03)

	SetVariable(VolumeRoundUpCurrent, VolumeSize * ZoneRoundUp)

# Aggragation
	SetVariable(VolumePerFreeUsed, 0)

	SetVariable(BlobFileSize, 10000000)

	SetVariable(SkipBlockFilesDay,100)
	SetVariable(SkipBlockFilesMonth,500)
	SetVariable(SkipBlockFilesYear,10000)

# Skip Block sorted
	SetVariable(SkipBlockFiles,"!SkipBlockFilesMonth!")

	  SetVariable(SkipBlockBytesDay,50000000)
	SetVariable(SkipBlockBytesMonth,500000000)
	 SetVariable(SkipBlockBytesYear,50000000000)

	SetVariable(SkipBlockBytes,"!SkipBlockBytesMonth!")

# LogFile
	SetVariable(LogFileName,"!ScriptDir!Logs\!ScriptDescription! !Date!_!Time!.log")

# Gap
# Gap Adjustments
	SetVariable(GapCalc, VolumeFreeAdj * ZoneAdjRoundUp)
	SetVariable(GapCalcMft, (100 - MftPer) * (VolumeFreeAdj * ZoneAdjRoundUp) )
	SetVariable(GapCalcOs, (100 - OsPer) * (VolumeFreeAdj * ZoneAdjRoundUp) )
	SetVariable(GapCalcOrig, VolumeFreeAdj * ZoneAdjRoundUp)

	SetVariable(GapRequested, RoundUp(ZoneEnd + GapCalc, VolumeRoundUpCurrent))
	SetVariable(GapAvailable, RoundDown(GapRequested, (MaxNextZoneBegin - VolumeRoundUpTiny))
	SetVariable(GapCurrent, RoundDown(GapCurrent, GapAvailable))
	SetVariable(GapActual, GapCurrent - ZoneEnd)

# Gap Calculation Methods:
	SetVariable(GapRequested, 0) 
	SetVariable(GapRequestedStd, 0) 
	SetVariable(GapRequestedMft, 0) 
	SetVariable(GapRequestedOs, 0) 
	SetVariable(GapRequestedOriginal, 0) 
	
# Gap Adjustments
	/* 1) Round Up to round Volume even numbers to prevent constant zone moves. */
	SetVariable(GapRounded, 0)

	/* 2) Adjust for previous zone overflow. */
	SetVariable(GapAdjusted, 0)

	/* 3) Adjust for total remaining volume space available. */
	SetVariable(GapAvailable, 0)

	SetVariable(GapCurrent, 0)

	/* Actual Size of Gap. */
	SetVariable(GapActual, 0)

	/* Current total percentage of free space used */
	SetVariable(ZoneFreePerUsed, 0)

	/* Zone actual size. */
	SetVariable(ZoneSizeActual, 0)
	
# Volume Totals
	/* Current total volume space used */
	SetVariable(VolumeUsedTotal, 0)

	/* Current percentage volume space used */
	SetVariable(VolumeUsedPer, 0)

	/* Current total of free space used */
	SetVariable(VolumeFreeRequested, 0)

	/* Current total of free space used */
	SetVariable(VolumeFreeUsed, 0)

	/* Actual free spaced consumed (after the adjustments & rounding) */
	SetVariable(VolumeFreePerUsed, 0)

End of list.
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* End. */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
