@echo off
rem 利用規約表示
title 1ClickBackup - 利用規約
type don'topen\termsofservice.txt
echo.
SET /P selected="利用規約に同意しますか？(Y=YES / N=NO)？"

if /i {%selected%}=={y} (goto :yes)

if /i {%selected%}=={yes} (goto :yes)

:no
goto :exit

:yes
cls
goto :success

:success
cls
rem バックアップ元のパス指定
title 1ClickBackup -作成 バックアップ元のパス指定
rem バックアップ元のパスを指定
echo バックアップ元のフォルダのパスを入力してください。
echo パスはフォルダアイコンをShiftキーを押しながら右クリックして「パスのコピー」をクリックしてください。(画像を参考にしてください)
echo そして「"」を消して入力してください。
don'topen\passcopy.png
set BKSRC=
set /p BKSRC="パスを入力。>>"

cls


rem バックアップ先のパスを指定
title 1ClickBackup -作成 バックアップ先のパス指定
echo バックアップ先のフォルダのパスを入力してください。
echo パスはフォルダアイコンをShiftキーを押しながら右クリックして「パスのコピー」をクリックしてください。(画像のような感じで)
echo そして「"」を消して入力してください。

set BKDES=
set /p BKDES="パスを入力。>>"

echo ファイルを生成しています。。。

rem ファイル生成
echo @echo off > 1clickbackup.bat
echo SET TIME_TEMP=%%TIME: =0%% >> 1clickbackup.bat
echo md "%BKDES%\%%date:~-10,4%%%%date:~-5,2%%%%date:~-2,2%%%%TIME_TEMP:~0,2%%%%TIME_TEMP:~3,2%%%%TIME_TEMP:~6,2%%" >> 1clickbackup.bat
echo xcopy "%BKSRC%" "%BKDES%\%%date:~-10,4%%%%date:~-5,2%%%%date:~-2,2%%%%TIME_TEMP:~0,2%%%%TIME_TEMP:~3,2%%%%TIME_TEMP:~6,2%%" /e /y >> 1clickbackup.bat
echo cls >> 1clickbackup.bat
echo echo 処理を終了しました。 >> 1clickbackup.bat
echo; >> 1clickbackup.bat
echo echo バックアップに失敗している場合は設定のパスの入力時に”を入力している場合があります。 >> 1clickbackup.bat
echo pause >> 1clickbackup.bat
echo; >> 1clickbackup.bat

echo rem BKSRC・・・バックアップ元(Backup source) >> 1clickbackup.bat
echo rem BKDES・・・バックアップ先(Backup destination) >> 1clickbackup.bat

cls

echo 最後に生成されたbatファイルに名前をつけてください。
set name=
set /p name="名前を入力>>"

ren 1clickbackup.bat %name%.bat
cls
echo ファイル名を%name%.batに変更しました。

echo 生成されたbatファイルはどこにおいても使用できます。


pause
rem 作業フォルダを削除
rem -----親ディレクトリに移動-----
cd ..
rem -----don'topenを削除-----
rd /s /q "%~dp0don'topen"
rem -----このファイルを削除-----
del "%~f0"

goto:exit
exit