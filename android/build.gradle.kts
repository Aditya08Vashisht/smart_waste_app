plugins {
    id("com.android.application")
    id("com.google.gms.google-services") version "4.4.2" apply false
}

android {
    compileSdkVersion(33) // Set the compile SDK version (use the appropriate version)

    defaultConfig {
        applicationId = "com.example.smart_waste_app"  // Replace with your app's ID
        minSdkVersion(21)  // Specify minimum SDK version
        targetSdkVersion(33)  // Set the target SDK version
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}

repositories {
    google()  // Include Google repositories
    mavenCentral()  // Include Maven Central
}

dependencies {
    implementation("com.google.firebase:firebase-analytics-ktx")
    // Add other dependencies
}
