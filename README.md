# TSP Parking

A parking app project for small and medium-sized parking areas, built with Flutter for the mobile application and a separate backend service. TSP Parking aims to provide a seamless experience for users looking for available parking spots, while also offering a management platform for parking lot operators.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Technologies Used](#technologies-used)
- [API Documentation](#api-documentation)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **Real-time Availability**: Users can see available parking spots in real time.
- **Reservation System**: Users can reserve parking spots in advance.
- **Payment Integration**: Secure payment options for users to pay for parking.
- **User Profiles**: Personalized profiles for users to manage their reservations.
- **Admin Dashboard**: Parking operators can manage their parking spots, view analytics, and adjust pricing.
- **Notifications**: Users receive notifications for reservation confirmations and reminders.

## Installation

### SDK requirements:

| Name           | Version        |
|----------------|----------------|
| Flutter        | 3.35.0         |
| Dart           | 3.9.0          |
| JDK            | OpenJDK 21.0.5 |
| Android Studio | 2025.1.4       |
| Android SDK    | 35             |

### Build application

To install the TSP Parking mobile application, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/tsp-parking-mobile.git
   ```
2. Navigate to the project directory:
   ```bash
   cd tsp-parking-mobile
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

## Usage

To run the mobile application:

1. Ensure the backend server is running.
2. Use an emulator or connect a physical device.
3. Run the following command:
   ```bash
   flutter run
   ```

### User Instructions

1. Create an account or log in to your existing account.
2. Search for available parking spots by entering your location.
3. Select a parking spot and reserve it.
4. Complete the payment process.

### Admin Instructions

1. Log in to the admin dashboard.
2. Manage parking spots and view analytics.
3. Adjust pricing and availability as needed.

## Technologies Used

- **Mobile App**: Flutter, Dart
- **Backend**: Golang
- **Database**: MongoDB
- **Authentication**: JWT (JSON Web Tokens)

## API Documentation

Refer to the [API Documentation](docs/api.md) for detailed information on the endpoints available in this application.

## Contributing

We welcome contributions! If you would like to contribute to TSP Parking, please follow these steps:

1. Fork the repository.
2. Create a new branch (e.g., `your-name/feature/your-feature`).
3. Make your changes and commit them.
4. Push to your branch and submit a pull request.

### Commit message rules

| Commit Type            | Emoji <https://gist.github.com/parmentf/035de27d6ed1dce0b36a>                                   |
|------------------------|-------------------------------------------------------------------------------------------------|
| Initial Commit         | [🎉  Party Popper](http://emojipedia.org/party-popper/)                                         |
| Version Tag            | [🔖  Bookmark](http://emojipedia.org/bookmark/)                                                 |
| New Feature            | [✨  Sparkles](http://emojipedia.org/sparkles/)                                                  |
| Bugfix                 | [🐛  Bug](http://emojipedia.org/bug/)                                                           |
| Security Fix           | [🔒  Lock](https://emojipedia.org/lock/)                                                        |
| Metadata               | [📇  Card Index](http://emojipedia.org/card-index/)                                             |
| Refactoring            | [♻️  Black Universal Recycling Symbol](http://emojipedia.org/black-universal-recycling-symbol/) |
| Documentation          | [📚  Books](http://emojipedia.org/books/)                                                       |
| Internationalization   | [🌐  Globe With Meridians](http://emojipedia.org/globe-with-meridians/)                         |
| Accessibility          | [♿  Wheelchair](https://emojipedia.org/wheelchair-symbol/)                                      |
| Performance            | [🐎  Horse](http://emojipedia.org/horse/)                                                       |
| Cosmetic               | [🎨  Artist Palette](http://emojipedia.org/artist-palette/)                                     |
| Tooling                | [🔧  Wrench](http://emojipedia.org/wrench/)                                                     |
| Tests                  | [🚨  Police Cars Revolving Light](http://emojipedia.org/police-cars-revolving-light/)           |
| Deprecation            | [💩  Pile of Poo](http://emojipedia.org/pile-of-poo/)                                           |
| Removal                | [🗑️  Wastebasket](http://emojipedia.org/wastebasket/)                                          |
| Work In Progress (WIP) | [🚧  Construction Sign](http://emojipedia.org/construction-sign/)                               |
| See more               | [Be creative](http://www.emoji-cheat-sheet.com/)                                                |

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries, please contact:

- **Your Name**: nam.tran@tsp.com.vn
- **GitHub**: [Tran-Duc-Nhat-Nam-270702]