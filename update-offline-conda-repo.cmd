IF [%CONDAROOT%] == [] GOTO usage
IF [%OFFLINE_CONDA_REPO%] == [] GOTO usage
IF [%ANACONDA_TOKEN%] == [] GOTO usage

cd conder
echo Installing prerequisites
docker build . -t linuxbuilder
call %CONDAROOT%\Scripts\activate.bat
call conda create -y -n offlinebuilder
call activate offlinebuilder
call conda install -y anaconda-client

echo Updating offline anaconda repository on %OFFLINE_CONDA_REPO%
call multiplatform-offline-repo.cmd %ANACONDA_TOKEN% %OFFLINE_CONDA_REPO%
cd ..

exit /b 0

:usage
echo REQUIRED ENV VARIABLES: CONDAROOT, OFFLINE_CONDA_REPO, ANACONDA_TOKEN