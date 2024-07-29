#
# Dockerfile for dbatools
#

FROM mcr.microsoft.com/powershell:7.4-alpine-3.17

SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

RUN Install-Module -Name dbatools
