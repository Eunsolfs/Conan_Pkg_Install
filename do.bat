@echo off
chcp 65001
setLocal EnableDelayedExpansion

rem -----------------------------------------------------------------------

:setPackgName
echo:
set /p pkgname=输入conanfile.txt的文件名然后敲回车键:
set matchStr=.txt
echo %pkgname% | findstr %matchStr% >nul && set pkgname=%pkgname% || set pkgname=%pkgname%%matchStr%

set key=yes
set /p key=输入的包名为 !pkgname!，确认无误? (yes,no,回车=yes):

if "%key%"=="yes" (
  goto MENU
)
if "%key%"=="y" (
  goto MENU
)
if "%key%"=="no" (
  goto ExitMenu
)
if "%key%"=="n" (
  goto ExitMenu
) else (
  goto ExitMenu
)

rem -----------------------------------------------------------------------

:MENU
set /a m_index = 0
echo 1.x86 static MT Release
echo 2.x86 static MT Debug
echo 3.x64 static MT Release
echo 4.x64 static MT Debug
echo 5.1234全部安装 【MT ALL】
echo 6.x86 dynamic MD Release
echo 7.x86 dynamic MD Debug
echo 8.x64 dynamic MD Release
echo 9.x64 dynamic MD Debug
echo 10.6789全部安装 【MD ALL】
echo 11.Install Another Pkg
echo 12.Exit
echo:
set /p choice=输入数字敲回车键:
if "%choice%"=="" (
  set choice=12
)
if %choice% EQU 1 (
  goto x86MTRelease
)
if %choice% EQU 2 (
  goto x86MTDebug
)
if %choice% EQU 3 (
  goto x64MTRelease
)
if %choice% EQU 4 (
  goto x64MTDebug
)

if %choice% EQU 5 (
  set /a m_index = 0
  goto installALL_MT
)

if %choice% EQU 6 (
  goto x86MDRelease
)
if %choice% EQU 7 (
  goto x86MDDebug
)
if %choice% EQU 8 (
  goto x64MDRelease
)
if %choice% EQU 9 (
  goto x64MDDebug
)

if %choice% EQU 10 (
  set /a m_index = 5
  goto installALL_MD
)

if %choice% EQU 11 (
  goto setPackgName
)
if %choice% EQU 12 (
  goto ExitMenu
)

echo 输入无效 &PAUSE>NUL&CLS&GOTO MENU
rem -----------------------------------------------------------------------

:installALL_MT
set /a m_index += 1
if !m_index! EQU 1 (
  goto x86MTRelease
)
if !m_index! EQU 2 (
  goto x86MTDebug
)
if !m_index! EQU 3 (
  goto x64MTRelease
)
if !m_index! EQU 4 (
  goto x64MTDebug
)
if !m_index! EQU 5 (
  goto MENU
)

rem -----------------------------------------------------------------------

:x86MTRelease
conan install !pkgname! -pr x86_MT_Release -u --build=missing
if !m_index! EQU 1 (
  goto goBack
) else (
  goto ExitMenu
)

:x86MTDebug
conan install !pkgname! -pr x86_MT_Debug -u --build=missing
if !m_index! EQU 2 (
  goto goBack
) else (
  goto ExitMenu
)

:x64MTRelease
conan install !pkgname! -pr x64_MT_Release -u --build=missing
if !m_index! EQU 3 (
  goto goBack
) else (
  goto ExitMenu
)

:x64MTDebug
conan install !pkgname! -pr x64_MT_Debug -u --build=missing
if !m_index! EQU 4 (
  goto goBack
) else (
  goto ExitMenu
)



rem -----------------------------------------------------------------------

:installALL_MD
set /a m_index += 1

if !m_index! EQU 6 (
  goto x86MDRelease
)
if !m_index! EQU 7 (
  goto x86MDDebug
)
if !m_index! EQU 8 (
  goto x64MDRelease
)
if !m_index! EQU 9 (
  goto x64MDDebug
)
if !m_index! EQU 10 (
  goto MENU
)

rem -----------------------------------------------------------------------

:x86MDRelease
conan install !pkgname! -pr x86_MD_Release -u --build=missing
if !m_index! EQU 6 (
  goto goBack
) else (
  goto ExitMenu
)

:x86MDDebug
conan install !pkgname! -pr x86_MD_Debug -u --build=missing
if !m_index! EQU 7 (
  goto goBack
) else (
  goto ExitMenu
)

:x64MDRelease
conan install !pkgname! -pr x64_MD_Release -u --build=missing
if !m_index! EQU 8 (
  goto goBack
) else (
  goto ExitMenu
)

:x64MDDebug
conan install !pkgname! -pr x64_MD_Debug -u --build=missing
if !m_index! EQU 9 (
  goto goBack
) else (
  goto ExitMenu
)

rem -----------------------------------------------------------------------

:goBack
if %choice% EQU 5 (if !m_index! NEQ 5 goto installALL_MT)
if %choice% EQU 10 (if !m_index! NEQ 10 goto installALL_MD)
goto MENU

rem -----------------------------------------------------------------------

:ExitMenu
echo:&echo 已退出! 

rem -----------------------------------------------------------------------

endlocal