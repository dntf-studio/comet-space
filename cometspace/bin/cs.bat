@echo off
rem [[comet working directory]] #comet space
set ab=%cd%

if "%1" == "space" (
    cd /d %~dp0
    cd ..
    if not "%2" == "" (
        for /f "eol=# tokens=1" %%i in (dynamic\.txt) do (
            if "%~2" == "%%i" (
                echo err: %~2 is already exists
                goto :eof
            )
        )
        if not "%3" == "" (
            cd %~dp0
            cd ..
            echo %~2 = %~3 >> dynamic\.txt
            echo :path has been saved succesly
        ) else (
            echo err: it must be "cs space %2 <absolute path>"
        )
    ) else (
        for /f "eol=# tokens=1,3" %%i in (dynamic\.txt) do (
            echo %%i = %%j 
        )
    )
) else if "%1" == "init" (
    cd /d %~dp0
    cd ..
    echo PATH = %~dp0> dynamic\.txt
    echo PATH = %~dp0
    echo :initialized succesly
) else if "%1" == "help" (
    echo initialize app:        cs init
    echo see path data:         cs space
    echo register new path:     cs space "<path name>" "<absolute path>"
    echo jump to saved path:    cs "<registerd path name>" 
) else (
    if not "%1" == "" (
        cd /d %~dp0
        cd ..
        for /f "eol=# tokens=1,3" %%i in (dynamic\.txt) do (
            if "%~1" == "%%i" (
                cd /d %%j
                goto :keep
            )
        )
    ) 
    echo basically: cs "<command>"
    echo if you need information, do: "cs help" 
)

:eof
cd /d %ab%
exit /b 0

:keep
exit /b 0


