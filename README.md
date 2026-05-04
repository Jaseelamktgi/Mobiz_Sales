# 📱 Mobiz Sales App

Mobiz Sales is a Flutter-based mobile application designed for managing sales, customers, and invoice generation.  
The app is built with a clean architecture approach using Bloc (Cubit) for state management.

---

## 🚀 Features

### 🔐 Authentication
- Login with username & password
- Secure API-based authentication
- Error handling & validation

### 👥 Customer Management
- View customer details
- Display customer info (name, address, contact, email)
- Select customer for sales

### 🛒 Product Management
- Fetch products from API
- View product list
- Product detail dialog with:
  - Product Type selection
  - Unit selection (PCS, BOX, etc.)
  - Dynamic price update from API
  - Quantity & amount calculation

### 🧾 Invoice Creation (Sales)
- Add multiple products
- VAT / NO VAT toggle
- Discount (Amount / Percentage)
- Auto calculation:
  - Total
  - Tax
  - Grand Total
- Submit invoice via API

---

## 🏗️ Architecture

The project follows **Clean Architecture + Bloc (Cubit)**:

lib/
│
├── core/
│ ├── utils/ # API, Auth, Helpers
│ ├── theme/ # Colors, Styles
│ └── widgets/ # Reusable UI components
│
├── features/
│ ├── auth/ # Login
│ ├── products/ # Product list & dialog
│ ├── customer/ # Customer selection
│ └── invoice/ # Invoice creation & API


---

## 🧠 State Management

- **Flutter Bloc (Cubit)**
- Reactive UI updates
- Separation of UI & business logic

---

🛠️ Tech Stack
Flutter (UI Framework)
Dart (Programming Language)
Bloc / Cubit (State Management)
REST API Integration
Clean Architecture
📦 Build & Run
flutter pub get
flutter run
Build APK
flutter build apk --release

## 🔌 APIs Used

### 1. Get Products
GET /api/get_product


### 2. Get Product Types

GET /api/get_product_type


### 3. Get Product Details

GET /api/get_product_detail


### 4. Create Invoice (Van Sale)
POST /api/vansale.store


#### Sample Request:
```json
{
  "customer_id": 6062,
  "store_id": 112,
  "user_id": 150,
  "van_id": 0,
  "discount": 10,
  "total": 300,
  "total_tax": 15,
  "grand_total": 315,
  "item_id": [12815],
  "quantity": [2],
  "mrp": [150],
  "product_type": [2],
  "unit": [1529]
}


