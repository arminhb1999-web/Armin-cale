# ArminCalc — AndroidIDE / GitHub version

A premium calculator app built with Kotlin + Jetpack Compose.

## Toolchain
- Android Gradle Plugin: 8.2.2
- Gradle: 8.2.1
- Kotlin: 1.9.22
- Compose compiler extension: 1.5.8
- compileSdk / targetSdk: 35
- minSdk: 26
- JDK: 17

## AndroidIDE
1. Clone this repository or download the ZIP.
2. Open the project root (the folder containing `settings.gradle.kts`) in AndroidIDE.
3. Use JDK 17.
4. Run Gradle Sync.
5. Run the `app` configuration.

## Command line
The included `gradlew` is a lightweight bootstrap script for AndroidIDE/mobile environments. It uses an installed `gradle` command when available, otherwise it downloads Gradle 8.2.1 and caches it under `~/.gradle/wrapper/dists/`.

```bash
./gradlew assembleDebug
```

If AndroidIDE itself is performing the sync, you do not need to run the command above manually.
