# Energy Monitoring UI (Flutter)

Flutter-only frontend that mirrors the provided React/Figma energy monitoring app. It includes four main tabs (Home, Charts, Alerts, Profile) plus a login screen, all driven by mock data and local state.

## Features
- Bottom navigation with Home, Charts, Alerts, Profile
- Home: daily consumption hero, stats tiles, active devices list, device control sheet
- Charts: weekly/monthly toggle, consumption summary, device breakdown bars
- Alerts: mock notifications with actionable rows
- Profile: user card, achievements, settings, notification preferences, personal info forms
- Login: simple form, password toggle, navigation into the main app

## Tech Stack
- Flutter 3.10+ (Material 3)
- No backend; all data is mock/local

## Getting Started
1) Install Flutter (3.10 or newer recommended).
2) Fetch dependencies:
```bash
flutter pub get
```
3) Run the app (choose your platform/device):
```bash
flutter run
```

## Project Structure (key files)
- `lib/main.dart` — App entry, theme, bottom navigation
- `lib/screens/` — UI screens (home, charts, alerts, profile, login, device control, sub-pages)
- `lib/widgets/` — Reusable UI components (e.g., device cards)
- `lib/models/` — Simple data models
- `lib/constants/` — Mock data and constants

## Mock Data
All lists (devices, charts, notifications, achievements) are defined locally in `lib/constants/app_constants.dart` and inside the respective screens. Replace or wire them to your backend when ready.

## Customization
- Update brand colors and typography in `main.dart` (ThemeData/ColorScheme).
- Replace mock data with your API calls and state management of choice.

## Notes
- This project targets UI parity; logic for auth/data is stubbed. Add real navigation to Register and real backend calls as needed.
