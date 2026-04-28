Name "System Plugin Example"
OutFile "Sheduletask.exe"
 
; TASK_TRIGGER is the struct that sets when your task in run.
; Setting it via the NSIS System plugin is a healthy alternative to
; banging ones head against the wall.
;
; general TASK_TRIGGER structure arguments
; 1, 2 - skip
; 3,4,5 - BEGIN year, month, day
; 6,7,8 - END year, month, day (SHOULD be = 0, if 1 flag is skipped)
; 9, 10 - Start hour, minute
; 11, 12 - Duration and Interval of task in minutes. (duration - the whole 
;          time task will work, interval - time between runs. D = 120, 
;          I = 10: task will be run every 10 minutes for 2 hours).
; 13 - flags (should be ored (|)):  
;          1 - task has end date (6,7,8 defined)
;          2 - task will be killed at Duration end
;          4 - task trigger disabled
; 14 - trigger type: there are 7 different types, every one with it own 
;          structure
;       0 = ONCE        task will be run once
;       5 = On IDLE     task will run on system IDLE (ITask->SetIdleWait)
;       6 = At System Startup

;       7 = At Logon
; these types use the following structure (so 7 means trigger at Logon):
;    push "*(&l2, &i2 0, &i2 2003, &i2 9, &i2 4, &i2 0, &i2 0, &i2 0, &i2 14, &i2 20, i 0, i 0, i 0, i 7, i 0, &i2 0, i 0, &i2 0) i.s"     

;       1 = DAILY  - field 15 gives interval in days (here it 15)
;    push "*(&l2, &i2 0, &i2 2003, &i2 9, &i2 3, &i2 0, &i2 0, &i2 0, &i2 13, &i2 10, i 0, i 0, i 0, i 1, &i2 15, i 0, i 0, &i2 0) i.s"

;       2 = WEEKLY  - field 15 gives interval in weeks (here 17), 
;                  field 16 - shows which days to run (OR them with |): 
;                  Sunday-Saturday (0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40)
;                  in example monday and friday
;    push "*(&l2, &i2 0, &i2 2003, &i2 9, &i2 3, &i2 0, &i2 0, &i2 0, &i2 13, &i2 10, i 0, i 0, i 0, i 2, &i2 13, &i2 0x2|0x20, &i2 0, i 0, &i2 0) i.s"

;       3 = MONTHLYDATE  - field 15 bit field of days (OR them) to run 
;                          (0x1-0x40000000), 
;                  field 16 - bit field of month (OR them with |): 
;                  January-December (0x1-0x800)
;                  in example (3 and 5 days of February and June)
;    push "*(&l2, &i2 0, &i2 2003, &i2 9, &i2 3, &i2 0, &i2 0, &i2 0, &i2 13, &i2 10, i 0, i 0, i 0, i 3, i 0x4|0x20, &i2 0x2|0x20, i 0, &i2 0) i.s"

;       4 = MONTHLYDOW  - field 15 week of month to run (1-5)
;                  field 16 - shows which days to run (OR them with |): 
;                  Sunday-Saturday (0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40)
;                  field 17 - bit field of month (or them with |): 
;                  January-December (0x1-0x800)
;                  in example (first week, monday and friday of February and June)
;    push "*(&l2, &i2 0, &i2 2003, &i2 9, &i2 3, &i2 0, &i2 0, &i2 0, &i2 13, &i2 10, i 0, i 0, i 0, i 4, &i2 1, &i2 0x2|0x20, &i2 0x2|0x20, i 0, &i2 0) i.s"
 
Function CreateTask
  !define GUIDTask "{148BD520-A2AB-11CE-B11F-00AA00530503}"
  !define GUIDITask "{148BD524-A2AB-11CE-B11F-00AA00530503}"
  !define GUIDTaskScheduler "{148BD52A-A2AB-11CE-B11F-00AA00530503}"
  !define GUIDITaskScheduler "{148BD527-A2AB-11CE-B11F-00AA00530503}"
  !define GUIDITaskTrigger  "{148BD52B-A2AB-11CE-B11F-00AA00530503}"
  !define GUIDIPersistFile "{0000010b-0000-0000-C000-000000000046}"
 
  SetPluginUnload  alwaysoff
 
  ; store registers and pop params
  System::Store "S r8r7r5r4r3r2r1r0"
 
  StrCpy $R0 "error" ; result 
 
  System::Call "ole32::CoCreateInstance(g '${GUIDTaskScheduler}', i 0, i 11, g '${GUIDITaskScheduler}', *i .R1) i.R9"
  IntCmp $R9 0 0 End
 
  ; ITaskScheduler->NewWorkItem()
  System::Call '$R1->8(w r0, g "${GUIDTask}", g "${GUIDITask}", *i .R2) i.R9' 
 
  ; IUnknown->Release()    
  System::Call '$R1->2() i'                    ; release Task Scheduler object
  IntCmp $R9 0 0 End
 
  ; ITask->SetComment()
  System::Call '$R2->18(w r1)'
 
  ; ITask->SetApplicationName()
  System::Call '$R2->32(w r2)'
 
  ; ITask->SetWorkingDir()
  System::Call '$R2->36(w r3)'
 
  ; ITask->SetParameters()
  System::Call '$R2->34(w r4)'
 
  ; ITask->CreateTrigger(trindex, ITaskTrigger)
  System::Call '$R2->3(*i .R4, *i .R5)'
 
  ; allocate TASK_TRIGGER structure
  System::Call '$5'
  Pop $R6
 
  ; ITaskTrigger->SetTrigger
  System::Call '$R5->3(i R6)'     
  ; ITaskTrigger->Release
  System::Call '$R5->2()'     
 
  ; free TASK_TRIGGER structure
  System::Free $R6
 
  ; ITask->SetAccountInformation
  System::Call '$R2->30(w r7, w r8)'
 
  ; IUnknown->QueryInterface
  System::Call '$R2->0(g "${GUIDIPersistFile}", *i .R3) i.R9'     ; QueryInterface
 
  ; IUnknown->Release()    
  System::Call '$R2->2() i'                    ; release Task  object
  IntCmp $R9 0 0 End
 
  ; IPersistFile->Save
  System::Call '$R3->6(i 0, i 1) i.R9'         
 
  ; release IPersistFile
  System::Call '$R3->2() i'                    
 
  IntCmp $R9 0 0 End
  StrCpy $R0 "ok"     
 
End:
  ; restore registers and push result
  System::Store "P0 l"
 
  ; last plugin call must not have /NOUNLOAD so NSIS will be able to delete the temporary DLL
  SetPluginUnload manual
  ; do nothing
  System::Free 0
 
FunctionEnd
;  
  ;  Section "SiteSecureBackup"
    ; SetOutPath $TEMP
    ; push "My Task"
    ; push "My Task Comment"
    ; push "c:\Working Dir\My Task Program.exe"
    ; push "c:\Working Dir"
    ; push "My Program Args"
    ; push \
      ; "*(&l2, &i2 0, \
	    ; &i2 2006, &i2 1, &i2 1, \
      ; &i2 0, &i2 0, &i2 0, \
      ; &i2 0, &i2 0, \
      ; i 0, i 0, \
      ; i 0, \
      ; i 1, \
      ; &i2 1, &i2 00, &i2 0, i 0, &i2 0) i.s"
    ; push "Username" use system user nt autority etc. dunno. todo
    ; push "Userpassword" should be empty for system tasks.
    ; Call CreateTask
    ; Pop $0
    ; MessageBox MB_OK "Backup job Scheduled task creation result: $0"
  ; SectionEnd
; 
; Delete Task
; 
; The following code can be added to the code above to delete a pre-existing task:
; 
; ; ITaskScheduler->Delete()
; System::Call '$R1->7(w r0) i.R9'
;
; Flags currently available:
; TASK_FLAG_INTERACTIVE (0x1)
; TASK_FLAG_DELETE_WHEN_DONE (0x2)
; TASK_FLAG_DISABLED (0x4)
; TASK_FLAG_START_ONLY_IF_IDLE (0x10)
; TASK_FLAG_KILL_ON_IDLE_END (0x20)
; TASK_FLAG_DONT_START_IF_ON_BATTERIES (0x40)
; TASK_FLAG_KILL_IF_GOING_ON_BATTERIES (0x80)
; TASK_FLAG_RUN_ONLY_IF_DOCKED (0x100)
; TASK_FLAG_HIDDEN (0x200)
; TASK_FLAG_RUN_IF_CONNECTED_TO_INTERNET (0x400)
; TASK_FLAG_RESTART_ON_IDLE_RESUME (0x800)
; TASK_FLAG_SYSTEM_REQUIRED (0x1000)
; TASK_FLAG_RUN_ONLY_IF_LOGGED_ON (0x2000) 
; 
 ; Function TaskA
 ; var TaskMgrFlags
 ; Push?
 ; StrCpy TaskMgrFlags (TASK_FLAG_DONT_START_IF_ON_BATTERIES && TASK_FLAG_KILL_IF_GOING_ON_BATTERIES && TASK_FLAG_HIDDEN)
; ITask->SetFlags()
; System::Call '$R2->28(i 0x2000)'
; 
; ITask->SetMaxRunTime()
; on Windows 7 and Vista this may have to be
; 0xFFFFFFFF - 1 (whatever that is, not sure
; whether the hex is interpreted as signed
; or unsigned
; System::Call '$R2->42(i 0xFFFFFFFF)'

; FunctionEnd