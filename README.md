# VibeCheck AI 🎭

An AI-powered mood analyzer app built with **Flutter** and **FastAPI**.

## 🌐 Live Demo
Check out the live app here: **[https://check-my-vibe.netlify.app](https://check-my-vibe.netlify.app)**

> **Deployed with:**
> - **Frontend**: Netlify (Flutter Web)
> - **Backend**: Render (FastAPI)

## 🚀 Features
- **Sentiment Analysis**: Uses Natural Language Processing (NLP) to determine if your vibe is Positive, Negative, or Neutral.
- **Cross-Platform**: Runs on Android, iOS, and Web (Flutter).
- **Fast Backend**: Powered by FastAPI for high-performance API handling.

## 🛠️ Tech Stack
- **Frontend**: Flutter (Dart)
- **Backend**: Python (FastAPI, TextBlob)

## 📦 Setup & Installation

### 1. Backend Setup
Navigate to the `backend` folder and install dependencies:

```bash
cd backend
pip install -r requirements.txt
```

Run the server:

```bash
uvicorn server:app --reload --host 0.0.0.0 --port 8000
```

> **Note**: The server runs on port `8000`.

### 2. Frontend Setup
Navigate to the `frontend` folder and get packages:

```bash
cd frontend
flutter pub get
```

### 3. Update API URL
If running on an Android Emulator, the default URL in `lib/home/provider/home_screen_provider.dart` might need to be changed to `http://10.0.2.2:8000/vibecheck`.
For physical devices, use your computer's local IP address (e.g., `http://192.168.1.X:8000/vibecheck`).

Run the app:

```bash
flutter run
```

## 📸 Screenshots
*(Add your screenshots here)*

---
Made with ❤️ by [Your Name]
