# VibeCheck AI 🎭

A simple vibe analyzer app that detects the sentiment of your text using AI. ⭐ **If you find this project helpful, please give it a star!**

🔗 **Live Demo**: [https://check-my-vibe.netlify.app](https://check-my-vibe.netlify.app)

## Demo

![App Demo](app_demo.gif)

## About This Project

This is my second project while learning Python FastAPI, combined with Flutter for the frontend. I built this to understand the basics of AI and Natural Language Processing (NLP).

### What I Learned

- **TextBlob**: A popular Python package for processing textual data. It comes with a pre-trained model that has already analyzed millions of sentences, so it understands language patterns and sentiment without any additional training.
- **NLP (Natural Language Processing)**: The technology that allows computers to understand and interpret human language.
- **FastAPI**: A modern, fast Python web framework for building APIs.
- **Flutter Web**: Cross-platform UI framework for building web applications.

## Tech Stack

| Component | Technology |
|-----------|------------|
| Frontend | Flutter (Dart) |
| Backend | Python (FastAPI + TextBlob) |
| Frontend Hosting | Netlify |
| Backend Hosting | Render |

## How It Works

1. User enters text in the app
2. Text is sent to the FastAPI backend
3. TextBlob analyzes the sentiment using NLP
4. Returns whether the vibe is **Positive**, **Negative**, or **Neutral**

## Local Setup

### Backend
```bash
cd backend
pip install -r requirements.txt
uvicorn server:app --reload --host 0.0.0.0 --port 8000
```

### Frontend
```bash
cd frontend
flutter pub get
flutter run
```

---

### A learning project exploring AI basics with Python, FastAPI and Flutter
