# Pertemuan 6 - 2306082

A simple Flutter application demonstrating the implementation of form validation in a login screen. This project is part of the "Praktikum Pemrograman Mobile" (Mobile Programming Practicum) coursework.

## Features

- **Login Form**: A basic login interface consisting of Username and Password fields.
- **Form Validation**: 
  - Validates that fields are not empty.
  - Enforces a minimum length of 4 characters for both the username and password.
- **Password Obscuring**: The password field input is obscured for security.
- **Feedback Mechanism**: Displays a `SnackBar` containing a success message upon successful validation and login.

## Project Structure

The main logic and UI of the application are contained within `lib/main.dart`:

- `MyApp`: The root widget that sets up the `MaterialApp` and configures the initial route.
- `LoginPage`: A `StatefulWidget` representing the login screen.
- `_LoginPageState`: Manages the state of the form, handles text controllers (`usernameController`, `passwordController`), and contains the validation logic.

## Getting Started

To run this project locally, ensure you have Flutter installed and configured on your system.

1. **Clone or Download** this repository.
2. **Navigate** to the project directory:
   ```bash
   cd pertemuan6_2306082
   ```
3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```
4. **Run the App**:
   ```bash
   flutter run
   ```

## Dependencies

- `flutter`: The core Flutter SDK.
- `cupertino_icons`: Default icons used in Flutter.

## Notes

- This project emphasizes the standard Dart camelCase conventions and memory management practices by properly disposing of `TextEditingController`s when they are no longer needed.
- Additional UI improvements were made, such as adding spacing between form fields to improve user experience.

# screenshot
![alt text](image.png)
