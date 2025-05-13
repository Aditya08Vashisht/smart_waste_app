plugins {
    id("com.android.application")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.smart_waste_app_new" // 🔁 Replace with your actual package name
    compileSdk = 33 // ✅ This fixes your error

    defaultConfig {
        applicationId = "com.example.smart_waste_app" // 🔁 Replace if needed
        minSdk = 21
        targetSdk = 33
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

dependencies {
    implementation("com.google.firebase:firebase-analytics-ktx")
    // Add other dependencies if needed
}
