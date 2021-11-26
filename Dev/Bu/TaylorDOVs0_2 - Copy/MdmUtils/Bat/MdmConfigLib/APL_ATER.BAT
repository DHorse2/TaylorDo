@rem
@echo off
@CD \COM\ANYWHERE
@IF not exist aterm.exe        CD \com\anywhere\CURR
@IF not exist aterm.exe        CD \com\anywhere\VS40
@IF not exist aterm.exe        CD \com\anywhere\VS30
@CD
@IF exist aterm.exe            ATERM
M
