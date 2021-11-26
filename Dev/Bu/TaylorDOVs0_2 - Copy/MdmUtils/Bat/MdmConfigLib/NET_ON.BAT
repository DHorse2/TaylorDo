@echo off
@rem
@DEL c:\lan_off.flg
@COPY c:\on.flg c:\lan_perm.flg
@rem COPY c:\on.flg c:\lan_on.flg
@IF exist g:\true.flg SUBST G: /D
LAN
