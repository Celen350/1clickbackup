@echo off
rem ���p�K��\��
title 1ClickBackup - ���p�K��
type don'topen\termsofservice.txt
echo.
SET /P selected="���p�K��ɓ��ӂ��܂����H(Y=YES / N=NO)�H"

if /i {%selected%}=={y} (goto :yes)

if /i {%selected%}=={yes} (goto :yes)

:no
goto :exit

:yes
cls
goto :success

:success
cls
rem �o�b�N�A�b�v���̃p�X�w��
title 1ClickBackup -�쐬 �o�b�N�A�b�v���̃p�X�w��
rem �o�b�N�A�b�v���̃p�X���w��
echo �o�b�N�A�b�v���̃t�H���_�̃p�X����͂��Ă��������B
echo �p�X�̓t�H���_�A�C�R����Shift�L�[�������Ȃ���E�N���b�N���āu�p�X�̃R�s�[�v���N���b�N���Ă��������B(�摜���Q�l�ɂ��Ă�������)
echo �����āu"�v�������ē��͂��Ă��������B
don'topen\passcopy.png
set BKSRC=
set /p BKSRC="�p�X����́B>>"

cls


rem �o�b�N�A�b�v��̃p�X���w��
title 1ClickBackup -�쐬 �o�b�N�A�b�v��̃p�X�w��
echo �o�b�N�A�b�v��̃t�H���_�̃p�X����͂��Ă��������B
echo �p�X�̓t�H���_�A�C�R����Shift�L�[�������Ȃ���E�N���b�N���āu�p�X�̃R�s�[�v���N���b�N���Ă��������B(�摜�̂悤�Ȋ�����)
echo �����āu"�v�������ē��͂��Ă��������B

set BKDES=
set /p BKDES="�p�X����́B>>"

echo �t�@�C���𐶐����Ă��܂��B�B�B

rem �t�@�C������
echo @echo off > 1clickbackup.bat
echo SET TIME_TEMP=%%TIME: =0%% >> 1clickbackup.bat
echo md "%BKDES%\%%date:~-10,4%%%%date:~-5,2%%%%date:~-2,2%%%%TIME_TEMP:~0,2%%%%TIME_TEMP:~3,2%%%%TIME_TEMP:~6,2%%" >> 1clickbackup.bat
echo xcopy "%BKSRC%" "%BKDES%\%%date:~-10,4%%%%date:~-5,2%%%%date:~-2,2%%%%TIME_TEMP:~0,2%%%%TIME_TEMP:~3,2%%%%TIME_TEMP:~6,2%%" /e /y >> 1clickbackup.bat
echo cls >> 1clickbackup.bat
echo echo �������I�����܂����B >> 1clickbackup.bat
echo; >> 1clickbackup.bat
echo echo �o�b�N�A�b�v�Ɏ��s���Ă���ꍇ�͐ݒ�̃p�X�̓��͎��Ɂh����͂��Ă���ꍇ������܂��B >> 1clickbackup.bat
echo pause >> 1clickbackup.bat
echo; >> 1clickbackup.bat

echo rem BKSRC�E�E�E�o�b�N�A�b�v��(Backup source) >> 1clickbackup.bat
echo rem BKDES�E�E�E�o�b�N�A�b�v��(Backup destination) >> 1clickbackup.bat

cls

echo �Ō�ɐ������ꂽbat�t�@�C���ɖ��O�����Ă��������B
set name=
set /p name="���O�����>>"

ren 1clickbackup.bat %name%.bat
cls
echo �t�@�C������%name%.bat�ɕύX���܂����B

echo �������ꂽbat�t�@�C���͂ǂ��ɂ����Ă��g�p�ł��܂��B


pause
rem ��ƃt�H���_���폜
rem -----�e�f�B���N�g���Ɉړ�-----
cd ..
rem -----don'topen���폜-----
rd /s /q "%~dp0don'topen"
rem -----���̃t�@�C�����폜-----
del "%~f0"

goto:exit
exit