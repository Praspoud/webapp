# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:latest AS build
WORKDIR /opt/webapp1

# copy csproj and restore as distinct layers

# copy everything else and build app
COPY . .
RUN dotnet publish -c Release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:latest
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "webapp1.dll"]
