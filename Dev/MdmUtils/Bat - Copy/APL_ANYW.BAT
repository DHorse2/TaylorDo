@rem
@echo off
@CD \COM\ANYWHERE
@IF not exist anywhere.exe        CD \com\anywhere\CURR
@IF not exist anywhere.exe        CD \com\anywhere\VS40
@IF not exist anywhere.exe        CD \com\anywhere\VS30
@CD
@IF exist anywhere.exe            ANYWHERE
M
