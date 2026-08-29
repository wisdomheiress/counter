.PHONY: build sync icon clean help

# Default target
all: build

## build: Sync assets and compile the Android APK
build:
	@./build.sh

## sync: Copy web assets and sync Capacitor without building APK
sync:
	@mkdir -p mobile/www
	@cp index.html mobile/www/index.html
	@cp icon.png mobile/www/icon.png 2>/dev/null || true
	@cd mobile && npm install --quiet && npx cap sync android

## icon: Re-generate Android app icons & splash screens from icon.png
icon:
	@mkdir -p mobile/assets
	@cp icon.png mobile/assets/icon.png
	@cd mobile && npx @capacitor/assets generate --android

## clean: Clean Gradle build cache
clean:
	@cd mobile/android && ./gradlew clean
