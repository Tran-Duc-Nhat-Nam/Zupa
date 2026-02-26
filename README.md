# TSP Parking (Zupa)

A professional parking management app designed for small and medium-sized parking areas. Built with Flutter, this mobile application follows **Clean Architecture** principles and integrates with a Go-based backend to provide a robust, scalable, and resilient experience for both users and operators.

## Table of Contents

- [Features](#features)
- [Architecture & Design](#architecture--design)
- [Technologies Used](#technologies-used)
- [Installation & Setup](#installation--setup)
- [Testing](#testing)
- [CI/CD](#cicd)
- [License](#license)
- [Contact](#contact)

---

## Features

- **Real-time Availability**: Monitor parking spot availability in real-time.
- **Resilient Networking**: Advanced interceptor logic with automatic retries for flaky connections (ideal for parking basements).
- **Secure Authentication**: JWT-based session management with biometric support.
- **Admin Dashboard**: Comprehensive analytics, pricing adjustments, and spot management.
- **NFC & Camera Integration**: Support for license plate recognition (LPR) and NFC tag check-ins.
- **Multi-language Support**: Fully internationalized using `slang`.

---

## Architecture & Design

This project adheres to **Clean Architecture** to ensure maintainability and testability:

- **Core**: Contains shared services (Storage, Auth Status), base widgets, and cross-cutting concerns (DI, Routing, Networking).
- **Features**: Modularized functionality (Auth, Revenue, Parking, etc.) divided into layers:
  - **Data**: Repositories implementation, DTOs, and API services (Retrofit).
  - **Domain**: Business logic, UseCases, and Entities (Freezed).
  - **Presentation**: UI widgets and State Management (BLoC/Cubit).

---

## Technologies Used

### Mobile Application
- **Framework**: [Flutter 3.41+](https://flutter.dev/)
- **State Management**: [BLoC / Cubit](https://pub.dev/packages/flutter_bloc)
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
- **Networking**: [Dio](https://pub.dev/packages/dio), [Retrofit](https://pub.dev/packages/retrofit), and [dio_smart_retry](https://pub.dev/packages/dio_smart_retry)
- **Routing**: [AutoRoute](https://pub.dev/packages/auto_route)
- **Forms**: [Reactive Forms](https://pub.dev/packages/reactive_forms)
- **Local Storage**: [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) & [Isar](https://pub.dev/packages/isar) (Cache)
- **Logging**: [Talker](https://pub.dev/packages/talker)

### Backend Services
- **Language**: Golang
- **Database**: MongoDB
- **Auth**: JWT (JSON Web Tokens)

---

## Installation & Setup

### Prerequisites

| Tool | Recommended Version |
|------|---------------------|
| Flutter | ^3.41.0 |
| Dart | ^3.11.0 |
| Android SDK | API 36 |
| JDK | OpenJDK 17/21 |

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Tran-Duc-Nhat-Nam-270702/Zupa.git
   cd Zupa
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate code**:
   This project relies on code generation for DI, routing, and APIs.
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

---

## Testing

We maintain a comprehensive testing strategy covering core business logic and state management.

- **Unit Testing**: Powered by `flutter_test`, `bloc_test`, and `mocktail`.
- **Run all tests**:
  ```bash
  flutter test
  ```

---

## CI/CD

The project includes a **GitHub Actions** workflow (`main.yml`) that:
- Triggers on version tags (`v*.*.*`).
- Validates code (Lints & Build).
- Builds release and debug APKs.
- Automatically creates a GitHub Release with the build artifacts.

---

## Contributing

We use semantic emoji-based commit messages. Please refer to our [Commit Guide](docs/contributing.md#commits) for details.

| Commit Type | Emoji |
|-------------|-------|
| New Feature | ✨ |
| Bugfix | 🐛 |
| Refactoring | ♻️ |
| Tests | 🚨 |

---

## License

This project is licensed under the MIT License.

## Contact

**Nam Tran** - nam.tran@tsp.com.vn  
**GitHub**: [Tran-Duc-Nhat-Nam-270702](https://github.com/Tran-Duc-Nhat-Nam-270702)