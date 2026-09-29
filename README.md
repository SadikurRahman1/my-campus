# 🎓 MyCampus

A modern and user-friendly **Flutter mobile application** designed for college and university students to manage their academic and campus activities from one place.

MyCampus provides a centralized digital campus experience where students can access their routine, attendance, notices, events, profile, and other academic information.

---

## 🚀 Project Overview

**MyCampus** was developed as part of a Flutter Developer technical challenge for **SoftTaqwa**.

The main goal of this project is to demonstrate:

* Clean and maintainable Flutter code
* Feature-based project structure
* Clean Architecture principles
* GetX state management
* Reusable custom widgets
* Responsive and modern UI
* Proper navigation and dependency management
* Scalable application architecture

> This project is a concept implementation inspired by the MyCampus project brief. It focuses primarily on UI implementation, code quality, application structure, and creativity.

---

## ✨ Features

### 🔐 Authentication

* Splash Screen
* Onboarding
* Login
* Registration
* Forgot Password
* OTP Verification
* Reset Password
* Custom success, error and information notifications

### 🏠 Dashboard

* Personalized greeting
* Student profile preview
* Notification access
* Promotional/announcement banner
* Quick access menu
* Latest notices
* Upcoming campus events

### 📅 Class Routine

* Weekly class schedule
* Day selector
* Subject information
* Teacher information
* Room number
* Class type
* Class timing

### 📊 Attendance

* Overall attendance percentage
* Present / absent / total classes
* Subject-wise attendance
* Semester selection
* Visual attendance progress

### 👤 Profile

* Student information
* Profile image
* Academic information
* Account actions

---

## 🛠️ Technologies Used

| Technology                 | Purpose                                             |
| -------------------------- | --------------------------------------------------- |
| Flutter                    | Mobile application development                      |
| Dart                       | Programming language                                |
| GetX                       | State management, navigation & dependency injection |
| Clean Architecture         | Application architecture                            |
| Feature-Based Architecture | Feature organization                                |
| Material Design            | UI components                                       |
| Git & GitHub               | Version control                                     |

---

## 🏗️ Architecture

The project follows a **Feature-Based Clean Architecture** approach.

```text
lib/
│
├── core/
│   ├── constants/
│   ├── exported_files/
│   ├── routes/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│   │
│   ├── splash/
│   │
│   ├── onboarding/
│   │
│   ├── auth/
│   │
│   ├── dashboard/
│   │
│   ├── routine/
│   │
│   ├── attendance/
│   │
│   ├── assignments/
│   │
│   ├── profile/
│   │
│   └── navigation/
│
└── main.dart
```

Each feature is organized into layers such as:

```text
feature/
├── data/
│   └── models/
│
└── presentation/
    ├── bindings/
    ├── controllers/
    ├── pages/
    └── widgets/
```

This structure makes the project easier to maintain, test, and extend.

---

## 🎯 Why Custom Widgets?

The project uses reusable custom widgets instead of depending heavily on UI code written directly inside pages.

For example:

```text
AuthButton
AuthHeader
AppSnackbar
QuickActionCard
NoticeCard
RoutineCard
AttendanceProgress
AttendanceSubjectCard
```

This approach helps keep the UI:

* Reusable
* Consistent
* Easy to maintain
* Easier to modify
* More scalable

It also reduces unnecessary changes across multiple screens when a common UI component needs to be updated.

---

## 🎨 UI & UX

The application focuses on:

* Clean and modern interface
* Consistent spacing
* Reusable components
* Rounded card-based design
* Clear typography
* Simple navigation
* Student-friendly interactions
* Responsive layouts

---

## 🔄 State Management

The project uses **GetX** for:

* Reactive state management
* Dependency injection
* Route management
* Controller lifecycle management

Example:

```dart
final selectedDay = 0.obs;
```

and:

```dart
Obx(
  () => Text(
    controller.selectedDay.value.toString(),
  ),
);
```

---

## 🧭 Navigation

Application navigation is managed using GetX named routes.

Example:

```dart
Get.toNamed(AppRoutes.login);
```

and:

```dart
Get.offAllNamed(AppRoutes.main);
```

Routes are centralized through `AppRoutes` and `AppPages`.

---

## 📱 Main Application Flow

```text
Splash
   ↓
Onboarding
   ↓
Login
   ↓
Main Navigation
   │
   ├── Dashboard
   │
   ├── Routine
   │
   ├── Attendance
   │
   ├── Notices
   │
   └── Profile
```

---

## 📂 Core Structure

```text
core/
├── constants/
│   ├── app_colors.dart
│   └── app_constants.dart
│
├── exported_files/
│   └── core_export.dart
│
├── routes/
│   ├── app_pages.dart
│   └── app_routes.dart
│
├── theme/
│   └── app_theme.dart
│
├── utils/
│   └── ...
│
└── widgets/
    ├── app_button.dart
    ├── app_text_field.dart
    └── app_snackbar.dart
```

---

## ⚙️ Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/SadikurRahman1/my-campus.git
```

### 2. Navigate to the project

```bash
cd my-campus
```

### 3. Get dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

---

## 📋 Requirements

Before running the project, make sure you have:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Android Emulator / Physical Android Device

---

## 🔮 Future Improvements

The current version focuses on the technical challenge requirements. The following features can be added in future versions:

* REST API integration
* Firebase Authentication
* Firebase Cloud Messaging
* Real-time notices
* Online class schedule
* Result management
* Assignment submission
* Event registration
* Push notifications
* Dark mode
* Teacher dashboard
* Admin dashboard
* Attendance API integration

---

## 👨‍💻 Developer

**Sadikur Rahman Sifat**

Flutter Developer | Mobile App Developer

* GitHub: [SadikurRahman1](https://github.com/SadikurRahman1)
* LinkedIn: [Sadikur Rahman](https://www.linkedin.com/in/sadikurrahman1/)

---

## 📄 Project Status

**Status:** 🚧 Technical Challenge Project

Built with ❤️ using **Flutter & Dart**.
