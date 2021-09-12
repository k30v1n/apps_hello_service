FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

COPY hello_app_service.csproj .
RUN dotnet restore hello_app_service.csproj

COPY . ./
RUN dotnet publish -c Release -o out hello_app_service.csproj

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "hello_app_service.dll"]