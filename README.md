# LIVE FOOTBALL

A live_football project created in Flutter using Test-Driven-Development, Clean Architecture, BLoC, API-Football and many more. It supports mobile and Top 6 European football leagues: Premier League, LaLiga, Serie A, Bundesliga, Ligue 1 and Ekstraklasa.

## Getting Started

The LiveFootball app allows user to check this season scores also live and future fixtures. The user can read scores, events, match informations, lineups and statistics.
When the user choose the league, can set the day of this season to see fixtures from that day and choose some to see all information about that match. 

## Installation

1. Get an API Key at https://www.api-football.com/pricing
2. Clone or download the repo
	git clone https://github.com/fylyppo/live_football.git
3. Install packages
	flutter pub get
4. Enter your API in lib/injection_container.dart
  
    ```
    dio.options.headers['x-apisports-key'] = 'ENTER YOUR API';
    ```
  
## Appearance

![Artboard – 5 bez tla](https://user-images.githubusercontent.com/63547653/167383533-78f4dd6a-2dd4-41ca-bde0-de7bdbd6471c.png)

## Features

- Home
- Dependency Injection with GetIt
- Dartz
- BLoC
- Code Generation: 
  - Routing with AutoRoute
  - Freezed and JsonSerializable
  - API connection with RetroFit
- TDD with Mocktail

## Folder Structure

lib/

|- core/

|- features/

|- main.dart

|- injection_container.dart


### Core Structure

core/

|- datasources/remote

 - |- api_football_client.dart
  
 - |- api_football_client.g.dart
    
   
|- error/

- |- messages/
 - |- exceptions.dart
 - |- failures.dart
    
|- network
  - |- network_info.dart

|- routing/
  -  |- app_router.dart
  - |- app_router.gr.dart

|- usecases/

  -  |- fixture_events_usecase.dart
   - |- fixture_lineups_usecase.dart
   - |- fixture_stats_usecase.dart
   - |- fixture_usecase.dart
   - |- fixtures_usecase.dart

|- utils/

  - |- date_utils.dart
  - |- input_converter.dart

### Features Structure
/features
 - |- fixtures/
 - |- leagues/
 - |- specific_fixture/
