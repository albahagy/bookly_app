# 📚 Bookly App - Flutter E-book Explorer

**Bookly** is a modern e-book browsing application built with **Flutter**, featuring a clean UI and robust architecture. It allows users to search for books, view details, and preview them directly within the app using Google Books API.

---

## ✨ Features
* **Dynamic Home Screen:** Browse through featured and newest books.
* **Real-time Search:** Powerful search functionality to find any book by title or author.
* **Book Details:** Comprehensive view for each book including description and ratings.
* **In-app Preview:** Open book previews using an integrated **WebView**.
* **Clean UI/UX:** Following the latest design trends with a focus on usability.

---

## 🏗️ Architecture & State Management
This project is built using **Clean Architecture** principles to ensure scalability and maintainability:
* **Pattern:** MVVM (Model-View-ViewModel).
* **State Management:** [Flutter BLoC / Cubit](https://pub.dev/packages/flutter_bloc) for predictable state transitions.
* **Dependency Injection:** [GetIt](https://pub.dev/packages/get_it) for efficient service locating.
* **API Integration:** [Dio](https://pub.dev/packages/dio) for handling HTTP requests.
* **Error Handling:** Functional programming approach using the `Dartz` package (`Either` type).

---

## 🛠️ Tech Stack
* **Language:** Dart
* **Framework:** Flutter
* **API:** Google Books API
* **Storage:** JSON Serialization

---

## 📸 Screenshots
| Home Screen | Search Screen | Details Screen |
| :---: | :---: | :---: |


---

## 🚀 How to Run
1. Clone the repository:
   ```bash
   git clone [https://github.com/albahagy/bookly_app.git](https://github.com/albahagy/bookly_app.git)
