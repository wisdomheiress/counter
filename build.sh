#!/usr/bin/env bash
set -e

# Change to project root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "🚀 Packaging TCG Counter for Android..."

# 1. Copy web assets to mobile/www
echo "📦 Copying web assets..."
mkdir -p mobile/www
cp index.html mobile/www/index.html
cp icon.png mobile/www/icon.png 2>/dev/null || true

# 2. Sync Capacitor
echo "🔄 Syncing Capacitor..."
cd mobile
npm install --quiet
npx cap sync android

# 3. Build APK
echo "⚙️ Compiling APK with Gradle..."
cd android
./gradlew assembleDebug --stacktrace

echo ""
echo "✅ Build Complete!"
echo "📍 APK output: mobile/android/app/build/outputs/apk/debug/app-debug.apk"
