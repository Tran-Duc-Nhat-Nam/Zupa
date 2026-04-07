# Zupa (TSP Parking)

<p>
  <img src="assets/images/park.png" alt="Zupa Logo" width="512"/>
</p>

A premium, professional parking management application designed for modern parking ecosystems. Built with **Flutter**, this project implements **Clean Architecture** to deliver a high-performance, maintainable, and resilient mobile experience.

---

## 🚀 Key Features

- **⚡ Real-time Availability**: Instant monitoring of parking spot occupancy and status.
- **🛡️ Resilient Networking**: Advanced Dio interceptors with automatic retries, optimized for low-connectivity environments like basements.
- **🔐 Secure Authentication**: JWT-based session management with biometric (FaceID/Fingerprint) support and secure local storage.
- **📊 Admin Dashboard**: Powerhouse analytics and management tools for operators.
- **📡 NFC & Computer Vision**: Integrated support for NFC tags and license plate recognition (LPR) via camera.
- **🌐 Global Ready**: Fully internationalized (i18n) supporting multiple languages via `slang`.
- **🛠️ Debug-First**: Integrated with `Talker` for advanced in-app logging and monitoring.

---

## 🏗️ Architecture & Design

The project follows a modular **Clean Architecture** approach to ensure a strict separation of concerns:

- **Core Layer**: Shared services, DI configuration, Routing (AutoRoute), and cross-cutting networking logic.
- **Feature Modules**: Encapsulated business features (Auth, Revenue, Parking) divided into:
  - **Data**: API services (Retrofit), Repositories, and DTOs.
  - **Domain**: Business entities (Freezed), UseCases, and Repository interfaces.
  - **Presentation**: UI widgets and State Management (BLoC/Cubit).

---

## 🛠️ Technology Stack

- **Framework**: [Flutter 3.41.5+](https://flutter.dev/)
- **State Management**: [BLoC / Cubit](https://pub.dev/packages/flutter_bloc)
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
- **Networking**: [Dio](https://pub.dev/packages/dio), [Retrofit](https://pub.dev/packages/retrofit) & cache interceptors.
- **Routing**: [AutoRoute](https://pub.dev/packages/auto_route)
- **Forms**: [Reactive Forms](https://pub.dev/packages/reactive_forms)
- **Local Persistence**: [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) & [Isar](https://pub.dev/packages/isar) (Cache)
- **Error Tracking**: [Talker](https://pub.dev/packages/talker) ecosystem

---

## ⚙️ Installation & Setup

### Prerequisites

| Tool        | Required Version |
|-------------|------------------|
| Flutter SDK | `^3.41.5`        |
| Dart SDK    | `^3.11.3`        |
| Java JDK    | `OpenJDK 17`     |

### Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Tran-Duc-Nhat-Nam-270702/Zupa.git
   cd Zupa
   ```

2. **Setup environment**:
   Create a `.env` file in the root directory (refer to `.env.example`).

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Code Generation**:
   The project uses code generation for localization, dependency injection, and routing.
   ```bash
   flutter pub run slang
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run Development Mode**:
   ```bash
   flutter run
   ```

---

## 🧪 Testing

We prioritize code quality with comprehensive test coverage:

- **Unit Tests**: Business logic and state transitions via `flutter_test` and `bloc_test`.
- **Mocks**: Consistent mocking using `mocktail`.

Run all tests:
```bash
flutter test
```

---

## 🚢 CI/CD Workflow

This project leverages **GitHub Actions** for an automated delivery pipeline (`main.yml`):

### Automated Release Pipeline
1. **Version Monitoring**: Automatically detects version bumps in `pubspec.yaml`.
2. **Quality Gates**: Runs Lints, `flutter pub run slang` localization, and builds all generated files.
3. **Verification**: Executes the full test suite.
4. **Build & Obfuscate**: Generates production-ready, obfuscated APKs with split-per-abi support.
5. **Auto-Release**:
   - Creates a new GitHub Release based on the `pubspec` version.
   - Uploads build artifacts (APKs) to the release.
   - Generates automated changelogs.
6. **Config Synchronization**: Automatically updates `versionarte.json` and pushes the updated configuration back to the main branch to ensure OTA (Over-the-Air) consistency.

---

## 🤝 Contributing

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification for all commit messages. This ensures a consistent and readable history.

### Commit Structure:
`<type>[optional scope]: <description>`

`[optional body]`

### Rules:
1. **Type**: Use one of the following:
   - `feat`: A new feature.
   - `fix`: A bug fix.
   - `docs`: Documentation only changes.
   - `style`: Changes that do not affect the meaning of the code.
   - `refactor`: A code change that neither fixes a bug nor adds a feature.
   - `perf`: A code change that improves performance.
   - `test`: Adding missing tests or correcting existing tests.
   - `build`: Changes that affect the build system or external dependencies.
   - `ci`: Changes to CI configuration files and scripts.
   - `chore`: Other changes that don't modify src or test files.
2. **Scope**: Optional. Use it to specify the module or feature area affected (e.g., `feat(auth):`).
3. **Description**: Use the imperative, present tense: "change" not "changed" nor "changes". Do not capitalize the first letter and do not end with a period.
4. **Body**: Use for more detailed explanations if the change is complex.
5. **Privacy**: Do NOT output names, e-mails, bug IDs, or unique identifiers.

### Examples:
- `feat(ui): add split-per-abi support for apk builds`
- `fix(ci): prevent workflow failure when versionarte.json is unchanged`
- `chore: update dependencies in pubspec.yaml`

---

## 📄 License

This project is licensed under the MIT License.

## ✉️ Contact

**Nam Tran** - [nam.tran@tsp.com.vn](mailto:nam.tran@tsp.com.vn)  
**GitHub**: [Tran-Duc-Nhat-Nam-270702](https://github.com/Tran-Duc-Nhat-Nam-270702)
