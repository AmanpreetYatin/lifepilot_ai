# 🚀 LifePilot AI

> Your Intelligent Life Assistant

LifePilot AI is a modern Flutter application that combines Artificial Intelligence, productivity, personal finance, task management, and document understanding into one beautiful mobile experience.

The goal of this project is to demonstrate production-level Flutter development using Clean Architecture, Riverpod, Firebase, and AI-powered features.

> **Status:** 🚧 Under Development

---

# ✨ Vision

LifePilot AI is designed to become an AI-powered personal assistant that helps users:

- ✅ Organize daily tasks
- 🤖 Interact with an AI assistant
- 📅 Plan schedules intelligently
- 💰 Track expenses
- 📄 Understand documents
- 📸 Scan receipts using AI
- 🎯 Achieve personal goals
- 📊 View productivity insights

Unlike traditional chat applications, LifePilot AI focuses on **AI Actions**, allowing AI to convert natural language into meaningful application actions such as creating tasks, reminders, schedules, and expense entries.

---

# 📱 Planned Features

## Core

- Splash Screen
- Beautiful Onboarding
- Authentication
- Home Dashboard
- Profile

## Productivity

- Task Management
- Calendar
- Smart Planner
- Goal Tracking

## AI

- AI Chat Assistant
- AI Intent Recognition
- AI Task Creation
- AI Daily Planner
- AI Productivity Insights

## Finance

- Expense Tracking
- Receipt Scanner
- Spending Analytics
- Budget Planning

## Documents

- Document Upload
- AI Summary
- AI Question & Answer

## Notifications

- Smart Reminders
- Push Notifications
- Daily AI Suggestions

---

# 🏗️ Architecture

The project follows **Feature First Clean Architecture**.

```
Presentation
     │
     ▼
Domain
     │
     ▼
Repository
     │
 ┌───┴───────────┐
 ▼               ▼
Local DB     Firebase
                 │
                 ▼
           Firebase AI Logic
```

---

# 📂 Project Structure

```
lib/
│
├── app/
├── core/
├── features/
├── shared/
└── main.dart
```

Each feature follows:

```
feature/
│
├── data/
├── domain/
└── presentation/
```

---

# 🛠️ Tech Stack

### Framework

- Flutter
- Dart

### State Management

- Riverpod

### Navigation

- GoRouter

### Backend

- Firebase

### AI

- Firebase AI Logic (Gemini)

### Database

- Cloud Firestore
- Drift (Offline Database)

### Local Notifications

- Flutter Local Notifications

### Charts

- fl_chart

---

# 🎨 UI Design

The application follows modern Material 3 design principles.

Highlights:

- Material 3
- Dark Mode
- Light Mode
- Responsive Layout
- Smooth Animations
- Glassmorphism
- Custom Design System

---

# 📄 License

This project is for educational and portfolio purposes.

---

# 🙌 Contributions

Suggestions and feedback are always welcome.

---

Made with ❤️ using Flutter.
