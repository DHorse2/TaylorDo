@Rem
@Rem Daily BackUp Procedures
@Rem Day: Monday
@Rem Data: Axion Development and Data
@Rem
@Rem Description: Performs a Dos copy of directories
@Rem on the basis that all Axion Data is present on
@Rem the drive Acs2_Sv2 (Drive Letter E:)
@Rem
@Rem The Valid sources for backup are:
@Rem Acs2_Opsys ...Axion Server2 Operating System (Max 650Mb)
@Rem Acs2_Sv2 .....Axion Development System and Data (no limit)
@Rem Acs2_Dos .....Axion MsDos Environment (PICK and the G/L)
@Rem .......(note: This is a FAT16 logical (non-bootable) partion)
@Rem Acs2_Sw ......Axion Windows Application and System Software
@Rem .......(note: Only includes system software not essential
@Rem .......to running the operating system after a CD Bootable
@Rem .......restore.)
@Rem .......(special note: Currently, Acs2_Sw is included with the
@Rem .......Acs2_Sv2 procedure.)
@Rem
@Rem The target is a directory is on drive Acs2_Bu_Da
@Rem (Drive Letter f:).  The directory is:
@Rem F:\BackUp\Monday\Acs2_Sv2
@Rem
@Rem Target directories are named for their sources and should
@Rem match the volume label of the drive the source is stored on.
@Rem In other words, a logical drive/partion is created for each
@Rem source, and this relationship:
@Rem Data Source to Drive Label to Backup Procedure,
@Rem
@Rem loosely matches the broad categories of information present on
@Rem the system.
@Rem 
@Rem
@Rem Author: Dave Horsman
@Rem Company: MacroScope Design Matrix
@Rem Date: 11 Sep 02
@Rem Revisions:
@Rem Date: xxx  Author: xxxx  What: xxxxx
@Rem
@Rem
@Echo .
@Echo .              Daily Backup
@Echo .
@Echo . For: Monday
@Echo .
@Echo . .....Data Source: Acs2_Sv2 & Acs2_Sw
@Echo .
@Echo . Data Description: Axion Development System and Data
@Echo . ................: Axion Windows Software and addt'l System Sw
@Echo .
@Echo . Enter Ctrl+C to abort or 
@PAUSE
@Rem
@Rem
@Echo .
@Echo .
@Call C:\Bat\Win98\CopySrc E:\*.* F:\BackUp\Monday\Acs2_Sv2 D
@Echo .
@Echo .
@PAUSE