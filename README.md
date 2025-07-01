# ♻️ Smart Waste Management App

> Empowering sustainable living through AI-powered mobile waste classification and barcode scanning.

## 📱 Overview

The **Smart Waste Management App** is a Flutter-based mobile application that harnesses the power of AI and computer vision to help users identify and report waste efficiently. Whether you're trying to sort recyclables from organics or explore product sustainability via barcode scanning, this app bridges technology and eco-conscious action.

## 🚀 Features

- ✅ **User Authentication**
  - Secure login & registration system.
  
- 📸 **AI-Based Waste Classification**
  - Integrated on-device **TensorFlow Lite** model to detect waste type: **Recyclable** or **Organic**.
  - Users can upload or capture images for classification.

- 📦 **Barcode Scanning**
  - Real-time scanning of products using a dedicated barcode API.
  - Intended for future integrations with sustainability databases.

- 💡 **Minimalist UI with Eco Theme**
  - Pastel colors and intuitive layout enhance usability and accessibility.

## 🛠️ Tech Stack

- **Frontend**: Flutter
- **Backend/API**: Flask (Barcode recognition & model inference)
- **Machine Learning**: TensorFlow Lite model with image classification (`model.tflite`)
- **Deployment**: Tested via GitHub Codespaces & ngrok

## 📸 Screenshots

| Login Screen | Home Screen | Waste Reporting |
|--------------|-------------|------------------|
![WhatsApp Image 2025-04-23 at 21 41 47_8e032528](https://github.com/user-attachments/assets/5bfd7f66-2af2-4476-885e-2101f888be62)
![WhatsApp Image 2025-04-23 at 21 41 47_8e032528](https://github.com/user-attachments/assets/10c6bc17-42a8-4eee-87ec-89a3b181d90f)
![WhatsApp Image 2025-04-23 at 21 40 26_463be101](https://github.com/user-attachments/assets/5c7b6390-60c9-45a9-85e2-a0d2db614797)


> _These screens highlight user flow from authentication to AI-based waste classification using real-world images._

## 🧠 Model Workflow

1. Image captured/uploaded by the user
2. Preprocessed and passed to the TFLite model
3. Returns predicted class: `"O"` (Organic) or `"R"` (Recyclable)
4. Displays result and allows user to submit it with a short description

## 🎯 Vision

This app is a step toward **smart and sustainable urban living**. With more integrations and crowd-sourced waste data, it can evolve into a civic-tech platform that empowers users to make better environmental choices daily.

## 👨‍💻 Author

**Aditya Vashisht**  
B.Tech (AI & ML), 3rd Year  
GitHub: [Aditya08Vashisht](https://github.com/Aditya08Vashisht)

---

