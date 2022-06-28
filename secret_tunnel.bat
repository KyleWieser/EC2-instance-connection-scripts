@echo off

setlocal
set ALPHA_IP=54.243.148.13
set BETA_IP=52.203.76.119
set GAMMA_IP=44.206.221.84
set DELTA_IP=44.207.17.207
set VNC_PASSWORD=chilicon


call :instance_choice

echo Connecting to %SELECTED_IP%

start ssh -L 5901:localhost:5901 -i chilicon-p2p-support.pem ec2-user@%SELECTED_IP%
vncviewer64-1.11.0.exe localhost:5901

endlocal
goto :eof


:instance_choice
echo 1: (Alpha 54.243.148.13^)
echo 2: (Beta  52.203.76.119^)
echo 3: (Gamma 44.206.221.84^)
echo 4: (Delta 44.207.17.207^)
set /p selectedinstance=Enter the number of the EC2 instance you wish to connect to: 
echo %selectedinstance%

if %selectedinstance%==1 (set SELECTED_IP=%ALPHA_IP%
)	else (
		if %selectedinstance%==2 (set SELECTED_IP=%BETA_IP%
		)	else (
				if %selectedinstance%==3 (set SELECTED_IP=%GAMMA_IP%
					) 	else (
							if %selectedinstance%==4 (set SELECTED_IP=%DELTA_IP%
							)	else goto :instance_choice

		)
	)
)

exit /B 0

