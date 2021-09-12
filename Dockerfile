FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

COPY apps_hello_service.csproj .
RUN dotnet restore apps_hello_service.csproj

COPY . ./
RUN dotnet publish -c Release -o out apps_hello_service.csproj

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "apps_hello_service.dll"]