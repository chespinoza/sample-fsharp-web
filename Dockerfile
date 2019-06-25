FROM mcr.microsoft.com/dotnet/core/sdk:2.2.300-alpine3.9

WORKDIR /app
COPY . /app
RUN dotnet publish -c Release -r linux-x64 --self-contained false

FROM  mcr.microsoft.com/dotnet/core/runtime:2.2.5-alpine3.9

WORKDIR /app
COPY --from=0 /app/bin/Release/netcoreapp2.2/linux-x64/publish .

ENTRYPOINT ["dotnet", "myFSharpApp.dll"]