set navn=DitNavn 
echo Hej, %navn%

:: kommentar?

   if "%variable%"=="værdi" (

       echo Variablen er lig med værdi.

   ) else (

       echo Variablen er ikke lig med værdi.

   )

 

   for %%i in (1 2 3) do (

       echo Dette er iteration nummer %%i.

   )