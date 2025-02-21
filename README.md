# Weather App

## Overview
The Weather App is a Flutter application built using Riverpod and the MVVM (Model-View-ViewModel) architecture to provide a clean and scalable code structure. The app allows users to sign up, log in, and view weather information for different cities.

## Features
- **User Authentication**: Sign up and log in securely.
- **Home Page**:
  - Displays current weather and date.
  - Allows users to search for weather information in different cities.
- **State Management**: Uses Riverpod for efficient and reactive state management.
- **Clean Architecture**: Follows MVVM principles to ensure maintainability and scalability.


https://github.com/user-attachments/assets/97af3553-dc06-498a-a902-445b6a70d8e1

https://github.com/user-attachments/assets/853a3280-c432-4d40-9028-f86366c8becb



## Project Structure
The app follows the Clean Architecture pattern, separating concerns into distinct layers:

```
lib/
│-- core/                # Core utilities and configurations
│-- data/                # Data sources and repositories
│-- domain/              # Business logic and use cases
│-- presentation/        # UI and ViewModels
│   │-- login/           # Login UI and ViewModel
│   │-- signup/          # Sign-up UI and ViewModel
│   │-- home/            # Home UI and ViewModel
│-- main.dart            # App entry point
```

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/weather_app.git
   ```
2. Navigate to the project directory:
   ```sh
   cd weather_app
   ```
3. Install dependencies:
   ```sh
   flutter pub get


   ```
4. Run the app:
   ```sh
   flutter run
   ```

## Dependencies
- **Riverpod**: State management
- **Dio**: API requests
- **Freezed & Json Serializable**: Model generation
- **Firebase Authentication**: User authentication

## API Integration
The app fetches weather data from an external weather API. Ensure you set up an API key in your environment configuration before running the app.


https://github.com/user-attachments/assets/23038d40-a6cd-48e1-be16-14c30d835ea9


## Contributing
Pull requests are welcome! Please follow the coding standards and guidelines.

## License
This project is licensed under the MIT License.
