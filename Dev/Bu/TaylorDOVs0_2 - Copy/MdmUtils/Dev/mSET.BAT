@Echo off
@Rem . Initialize
@Rem .
@Set mSetScriptDir=Settings
@Rem .
@Set mSetSource=Empty
@Set mSetSourceDir=SettingsData
@Rem .
@Set mSetTarget=Validating
@Set mSetTargetDir=Settings
@Set mSetTargetExt=%MdmDefragOptExt%
@IF not exist %mSetScriptDir%\mSetTargetExt.Extension Set mSetTargetExt=Settings
Set mSyntaxForm=Validating
@Rem .
@Rem . Validate command
@Rem .
@Rem . Help:
@If %2==/?       GoTo SYNTAXHELP
@If %2==/Doc     GoTo SYNTAXDOC
@Rem .
@Rem . Features and settings:
Set mFeature=%1
Set mSetting=%2
Set mValueState=%3
@Rem .
@Rem . Check if mSetting (%mSetting%) is empty.
@Rem .
@If     exist %mSetSourceDir%\Empty%mSetting%.data          GoTo OPTIONEMPTY
@Rem .
@Rem . Check if mSetting (%mValueState%) is empty.
@Rem .
@If not exist %mSetSourceDir%\Empty%mValueState%.data       GoTo SYNTAX1
@Rem .
@Rem . A two argument command is a global command for
@Rem . the feature. It otherwise works the same way.
@Rem . Shift mSetting to mValueState and use "Global"
@Rem . for mSetting.
@Rem .
Set mValueState=mSetting
Set mSetting=Global
@Rem .
@Rem . Adjusted form.
@Rem .
:SYNTAX1
@Rem .
@Rem . Validate the command.
@Rem .
Set mCommand=%mFeature%_%mSetting%
Set mCommandFull=%mFeature%_%mSetting%_%mValueState%
Set mSyntaxForm=NotSet
@Rem .
@Rem . Feature:
@If not exist %mSetSourceDir%\%mFeature%\%mFeature%.feature       GoTo FEATURENOTEXIST
@Rem .
@Rem . Check if the full command is an existing ".data" file.
@Rem . If it is then we have an Enum command regardless of 
@Rem . if values are also valid input.
@Rem .
@If     exist %mSetSourceDir%\%mFeature%\%mCommandFull%.data      GoTo SYNTAX1VALID
@Rem .
@Rem . Check if the command exists (by having a ".data" file.)
@Rem .
@If not exist %mSetSourceDir%\%mFeature%\%mCommand%.data          GoTo OPTIONNOTEXIST
@Rem .
@Rem . Check if the command accepts values.
@Rem . If the feature accepts a value you can't really validate further.
@Rem .
@If     exist %mSetSourceDir%\%mFeature%\%mFeature%.value         GoTo SYN1VALUE
@Rem .
@Rem . Enumeration of States.
@Rem .
:SYNTAX1ENUM
Set mSyntaxForm=Enum
@Rem .
@Rem . We have a State, not a Value.
@Rem . File definitions have the form: Feature_Setting_State
@Rem . So for example: Pause_ZoneSubzone_On
@Rem .
@Rem . Even though the feature exists we check and will
@Rem . move the ".data"; file which must contain valid script
@Rem . (in the target language format normally.)
@Rem .
@Rem . The Setting exists, verify the State is allowed.
@Rem . For Enums of States a ".data" file will exist for
@Rem . each valid entry.
@Rem .
@If     exist %mSetSourceDir%\%mFeature%\%mCommandFull%.data      GoTo SYNTAX1VALID
@Rem .
@Rem . You failed!
@GoTo OPTIONNOTEXIST
@Rem .
@Rem . Commands accepting Values.
@Rem .
:SYN1VALUE
Set mSyntaxForm=Value
Echo %1.prefix >  
%2xxx 1>> TEST2%1Result.bat


@If not exist Settings\%mFeature%\Rev.flg                 GoTo DRVCHNG
@If not exist %OpSys.Drv%\Rev.flg                 GoTo DRVCHNG


@GoTo SYNTAX1VALID
@Rem .
@Rem . Other Syntax?
@Rem . Ie. Two parameter form or something.
@Rem .
:SYNTAX2


@GoTo SYNTAX1VALID
@Rem .
@Rem . VALID!!!
@Rem .
:SYNTAX1VALID
@Rem . Move current to last in case a swap is needed (this is a temp call)
@Rem .
@Rem . @If     exist %mSetTargetDir%\%mCommand%.mSetTargetExt 

Copy %mSetTargetDir%\%mCommand%.mSetTargetExt %mSetSourceDir%\%mFeature%\%mCommand%.last (o)
@Rem .
@Rem . Copy the script for the option into the live script file
@Rem . used by the application or module.
@Rem .
@Copy %mSetSourceDir%\%mFeature%\%mCommand%.data %mSetTargetDir%\%mCommand%.mSetTargetExt (o)
@Rem .
@Rem . Set the current state
@Rem .
Del %1*.state
Copy %mSetTargetDir%\%mCommand%.mSetTargetExt %mSetSourceDir%\%mFeature%\%mCommand%.State (o)

@Rem .


@GoTo ENDSCRIPTOK
@Rem .
:NOFEATURE
@Echo . You did not enter a feature to set. 

@GoTo SYNTAXHELP
@Rem .
:NOOPTION
@Echo . You did not enter an option for the feature you want to set. 

@GoTo SYNTAXHELP
@Rem .
:FEATURENOTEXIST
@Echo . You did not enter an option for the feature you want to set. 

@GoTo SYNTAXHELP
@Rem .
:OPTIONEMPTY
@Echo . You did not enter an option / setting for this feature. 

@GoTo SYNTAXHELP
@Rem .
:OPTIONNOTEXIST
@Echo . That option does not exist for this feature. 

@GoTo SYNTAXHELP
@Rem .
:VALUENOTALLOWED
@Echo . That is not a valid value for this feature option. 

@GoTo SYNTAXHELP
@Rem .
:SYNTAXHELP
@call mSetDocSyntax
@Rem .
@GoTo ENDSCRIPT
@Rem .
:SYNTAXDOC
@Echo . Here is the developer notes for the mSet command:  
@Type mSetDevDoc.txt | More

@GoTo ENDSCRIPT
:ENDSCRIPTOK
@Echo .
@Echo . Command executed successfully.
@Rem .
:ENDSCRIPT
@Echo .
@Echo . End.


@Echo . Simply wrap %2 into the .result file named %1
@Echo .
@Echo . del TEST2%1.result
@del TEST2%1.result
@Echo .
@Echo . Echo %2 1> TEST2%1Result.bat
@Echo @Echo . 1> TEST2%1Result.bat
@Echo @Echo . xxx%2xxx 1>> TEST2%1Result.bat
@Echo @Echo . 1>> TEST2%1Result.bat
@Echo @Echo . Done 1>> TEST2%1Result.bat
@Echo .
@Echo . Result:
@Type TEST2%1.result
@Echo .
@Echo . Done.