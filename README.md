# TCG Counter — Life & Match Tracker

A responsive two-player TCG life counter and match tracker packaged for Android using **Capacitor**.

---

## 📋 Requirements

Before building the APK, ensure you have:
- **Node.js** (v18+)
- **Android Studio** (or Android SDK & JDK 17/21)

---

## ⚡ Quick Start: Build the Android APK

To build the APK in a single command, run:

```bash
./build.sh
```

*(or `make` if you use Make)*

This automatically copies your latest web assets, syncs Capacitor, and builds the debug APK.

---

## 📦 APK Output Location

Once compiled, your APK file will be saved at:
`mobile/android/app/build/outputs/apk/debug/app-debug.apk`

---

## 🛠️ Commands Reference

| Command | Description |
| :--- | :--- |
| `./build.sh` or `make` | Full build: sync web assets and compile APK |
| `make sync` | Sync `index.html` & assets to Capacitor without compiling |
| `make icon` | Re-generate Android launcher icons & splash screens from `icon.png` |
| `make clean` | Clean Android Gradle build cache |

---

## 📁 Repository Structure

- `index.html` — Core web application
- `icon.png` — App icon asset
- `build.sh` / `Makefile` — Automated build scripts
- `mobile/` — Capacitor & Android project files
