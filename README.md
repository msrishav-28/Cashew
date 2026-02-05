# Cashew (Platinum Tier)

![Flutter Version](https://img.shields.io/badge/Flutter-3.19.0-blue?style=for-the-badge&logo=flutter)
![Dart Version](https://img.shields.io/badge/Dart-3.0.0-blue?style=for-the-badge&logo=dart)
![Supabase](https://img.shields.io/badge/Supabase-Backend-green?style=for-the-badge&logo=supabase)
![Vercel](https://img.shields.io/badge/Vercel-Deployed-black?style=for-the-badge&logo=vercel)
![License](https://img.shields.io/badge/License-GPLv3-red?style=for-the-badge)

**Cashew** is a premium, offline-first financial management platform designed for the modern web. It combines personal budgeting with advanced group expense splitting, wrapped in a high-fidelity "Platinum Tier" interface featuring glassmorphism, mesh gradients, and fluid animations.

Rebuilt in 2026, this version introduces a robust hybrid architecture: **Drift (SQLite)** for offline resilience and **Supabase (PostgreSQL)** for real-time cloud synchronization.

---

## Architecture & Technology Stack

This project follows a strict **Atomic Design** system to ensure scalability and visual consistency.

### Frontend (Flutter Web / PWA)
*   **Design System**: "Platinum Tier" unified visually language (Glassmorphism, Neon Accents, Mesh Gradients).
*   **State Management**: Mixed architecture (Provider + ValueNotifier) for high-performance reactive UI.
*   **Routing**: Vercel-optimized SPA routing with deep link support.

### Backend (Supabase + Drift)
*   **Offline-First**: Local SQLite database (Drift WASM) ensures zero-latency interactions even without internet.
*   **Cloud Sync**: Background synchronization queue powered by `SyncController` with Last-Write-Wins conflict resolution.
*   **Security**: Row Level Security (RLS) policies enforce strict data isolation for both personal and group data.

---

## Key Features

### 1. Platinum Interface
A complete visual overhaul focusing on information density and aesthetic depth.
*    **Glassmorphic Cards**: Content floats on frosted glass layers with dynamic lighting.
*   **Mesh Gradients**: Subtle, organic background animations that bring the app to life.
*   **Haptic Feedback**: Micro-interactions for buttons and inputs (where supported).

### 2. Advanced Group Management (Splitwise Integration)
Full-featured expense sharing system built into the core.
*   **Smart Splitting**: Support for Equal, Percentage, Shares, and Exact Amount splitting.
*   **Dept Simplification**: Implemented "Greedy Algorithm" to minimize the number of transactions required to settle group debts.
*   **Activity Feed**: Real-time audit trail of all group actions.

### 3. Enterprise-Grade Sync
*   **Optimistic UI**: Interface updates instantly; sync happens in the background.
*   **Cross-Platform**: Seamless state synchronization across Web, Android, and iOS.

---

## Deployment

### Vercel (Production)
The application is configured for seamless deployment on Vercel.

1.  **Build**:
    ```bash
    flutter build web --release --web-renderer canvaskit
    ```

2.  **Deploy**:
    ```bash
    vercel deploy --prod
    ```

*   Includes `vercel.json` for SPA routing configuration.
*   Includes `manifest.json` for full PWA installation support.

---

## Local Development

### Prerequisites
*   Flutter SDK (3.19.0+)
*   Supabase Project (for cloud features)

### Setup
1.  **Clone the repository**:
    ```bash
    git clone https://github.com/jameskokoska/Cashew.git
    ```

2.  **Database Setup (Supabase)**:
    *   Navigate to your Supabase project's **SQL Editor**.
    *   Open `FINAL_SUPABASE_SCHEMA.sql` (root of this repo).
    *   Run the entire script to generate tables, RLS policies, and functions.

3.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run locally**:
    ```bash
    flutter run -d chrome
    ```

---

## License

Distributed under the GNU General Public License v3.0. See `LICENSE` for more information.
