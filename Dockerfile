# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:7.0-jammy AS build
WORKDIR /source

RUN export DOTNET_USE_POLLING_FILE_WATCHER=true 

# copy csproj and restore as distinct layers
COPY app/*.csproj .
RUN dotnet restore -r linux-x64

# copy everything else and build app
COPY app/. .
RUN dotnet publish -c Release -o /app -r linux-x64 --self-contained false --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:7.0-jammy-amd64
WORKDIR /app

RUN useradd --uid $(shuf -i 2000-65000 -n 1) app
USER app
 
EXPOSE 80
COPY --from=build /app .
ENTRYPOINT ["dotnet", "app.dll"]
