:: Setup the environment to work with conda. When finished, drops into a conda prompt with base environment activated.

:: Don't echo
@echo off

:: User needs to manually set the Miniconda instalation path(line 7)
::set Miniconda=
set Miniconda=%LocalAppData%\Programs\Python\Miniconda

:: Call Miniconda's own setup script
call %Miniconda%\Scripts\activate.bat %Miniconda%
