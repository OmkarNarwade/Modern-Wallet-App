# 💳 Modern Wallet App

A Flutter-based modern wallet UI showcasing credit card details, rewards, transaction history, and a brand selection bottom sheet.
This project demonstrates clean UI design, modular file structure, and reusable widgets.

## ✨ Features

- 📱 Modern wallet dashboard UI

- 💳 Interactive credit card (flip animation)

- 📊 Stats cards for Current Limit & Payment Due

- 🧾 Animated transaction history list

- 🏷️ Brand selection with bottom sheet

- 🎨 Clean typography using Google Fonts

- 🤖 Demonstrates AI-assisted development (see below)

 ## 🛠 AI Skills Demonstration

This project highlights how AI tools were used to enhance development efficiency:

Code Refactoring & Modularization

Used AI (ChatGPT) to split the monolithic main.dart file into multiple modules:

- screens/modern_wallet_screen.dart

- widgets/stat_card.dart

- widgets/transaction_tile.dart

- widgets/brand_bottom_sheet.dart

- models/transaction.dart

- utils/icons.dart

Result: Cleaner structure, easier maintenance, and improved readability.

Widget Creation & UI Tweaks

AI helped create reusable widgets like StatCard and TransactionTile.

Assisted in adding animations and styling for a professional UI/UX.

Documentation & README Generation

Used AI to generate detailed README, folder structure, and instructions for easy GitHub setup.

**Concrete Example:**
Before AI assistance, the project had all functionality in main.dart, making it hard to maintain. Using AI, the code was split into modular files, reducing complexity by ~60% and enabling faster future enhancements.

## 📂 Project Structure

```bash
lib/
│── main.dart
│
├── screens/
│   └── modern_wallet_screen.dart
│
├── widgets/
│   ├── stat_card.dart
│   ├── transaction_tile.dart
│   └── brand_bottom_sheet.dart
│
├── models/
│   └── transaction.dart
│
└── utils/
    └── icons.dart
```

🚀 Getting Started
1️⃣ Clone the repository
```bash
git clone https://github.com/OmkarNarwade/Modern-Wallet-App.git
cd modern-wallet
```

2️⃣ Install dependencies
```bash
flutter pub get
```

3️⃣ Run the app
```bash
flutter run
```

## 📦 Dependencies

- google_fonts

- u_credit_card

- font_awesome_flutter

## 🛠️ Customization

- Add new brands in utils/icons.dart.

- Update transactions in modern_wallet_screen.dart.

- Replace reward messages with your logic.
