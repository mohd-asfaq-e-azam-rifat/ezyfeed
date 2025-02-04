# Ezyfeed

Ezyfeed is a community feed application using Flutter.

## Overview

- Fetch posts from the provided API and display them in a feed format.
- Include features user authentication, creating new posts, reacting to posts, commenting, replying.
- Uses **FVM** to manage Flutter versions for easier SDK transition.
- Follows the **BLoC** (Business Logic Component) pattern for state management.
- Implements **MVVM** (Model-View-ViewModel) architecture for clean separation of concerns.
- Dependency injection using **get_it** and **injectable**.
- Navigates using **go_router**.
- Uses **freezed**, **json_serializable** with **build_runner** to generate data models.
- Makes API requests using **dio**, a great network tool.
- Persists using **get_storage**, a fast, extra light and synchronous key-value in memory.
- Production-level **GitFlow** for feature development and version control.

## Getting Started

### Prerequisites

Make sure to have the following installed:

- FVM (Optional): [FVM: Flutter Version Management](https://fvm.app/documentation/getting-started)
- Flutter SDK: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK: [Dart Installation Guide](https://dart.dev/get-dart)

### Running the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/mohd-asfaq-e-azam-rifat/ezyfeed.git
   ```
2. Clean the workspace to ensure a fresh start:
   ```bash
   flutter clean
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Generate code for injectable:
   ```bash
   flutter dart run build_runner build -d
   ```
5. Run the app:
   ```bash
   flutter run
   ```

## Workflow

Ezyfeed follows the **GitFlow** branching model:

- **master**: Contains production-ready code.
- **development**: All feature branches are merged here before merging into `master`.
- **feature/xyz**: Used for developing individual features before merging into `development`.

## Contributing

Contributions are welcome! Feel free to submit a pull request or open an issue if you have
suggestions for improvement.

---

Made with ❤️ using Flutter
