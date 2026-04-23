# 🍣 Flutter Food Ordering App

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Stars](https://img.shields.io/github/stars/imtusharrai/flutter_food_ordering_app?style=social)](https://github.com/imtusharrai/flutter_food_ordering_app/stargazers)
[![Forks](https://img.shields.io/github/forks/imtusharrai/flutter_food_ordering_app?style=social)](https://github.com/imtusharrai/flutter_food_ordering_app/network/members)

A beautifully designed food ordering app built with **Flutter**. Features a modern UI with smooth animations, vibrant food cards, restaurant listings, and a polished ordering flow.

## 📱 Screenshots

<p align="center">
  <img src="food-ordering-app.png" alt="App Screenshots" width="700"/>
</p>

## ✨ Features

- 🎨 **Modern UI Design** — Vibrant color palette with blue, green, and dark themed food cards
- 📱 **Responsive Layout** — Adapts beautifully to different screen sizes
- ⭐ **Star Ratings** — Smooth star rating system for restaurants and dishes
- 🛒 **Cart System** — Floating cart button for quick ordering
- 🔍 **Search** — Built-in search functionality
- 📋 **Restaurant Listings** — Browse restaurants with descriptions, ratings, and order buttons
- ❤️ **Favorites** — Mark your favorite dishes with the heart button
- 🍱 **Dish Details** — Detailed view for each dish with restaurant suggestions
- 📐 **Custom Navigation** — Rounded bottom navigation bar with 4 tabs

## 🏗️ Architecture

```
lib/
├── main.dart          # Home page with food cards & restaurant listings
└── detailpage.dart    # Dish detail page with restaurant suggestions
```

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.x or higher)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- An Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/imtusharrai/flutter_food_ordering_app.git
   cd flutter_food_ordering_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Run on Physical Device (USB Debugging)

```bash
# List connected devices
flutter devices

# Run on specific device
flutter run -d <device-id>
```

## 📦 Dependencies

| Package | Description |
|---------|-------------|
| [smooth_star_rating_nsafe](https://pub.dev/packages/smooth_star_rating_nsafe) | Customizable star rating widget |
| [cupertino_icons](https://pub.dev/packages/cupertino_icons) | iOS-style icons |

## 🎨 Design System

| Element | Color |
|---------|-------|
| Primary Blue | `#00B1FF` |
| Success Green | `#00D99E` |
| Card Green | `#00E582` |
| Card Dark | `#535353` |
| Order Button | `#00D672` |
| Star Rating | `#FFA127` |
| Text Primary | `#2A2A2A` |

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web (experimental)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Tushar Rai** — [@imtusharrai](https://github.com/imtusharrai)

- 🌐 [traiinc.com](https://www.traiinc.com)
- 🐦 [@imtusharrai](https://twitter.com/imtusharrai)
- 💼 [Google Dev Profile](https://g.dev/tusharrai)
- 📚 [Stack Overflow](https://stackoverflow.com/users/5846565/tushar-rai)

---

<p align="center">
  Made with ❤️ and Flutter
</p>