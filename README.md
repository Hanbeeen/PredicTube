# 🎥 PredicTube: AI-based Performance Prediction and Optimization Service for YouTube Content

> **Team ThunderCoding (벼락코딩)**  
> **Project Period**: Sep 25, 2023 – Feb 1, 2024  
> **Project Type**: Youth-led Real-World Experience Project  
> **Developed By**: Hanbin Im, Jeonghoon Jeong  

---

## 📌 Demostration Video

[![Video Label](http://img.youtube.com/vi/UXic_qg4fbo/0.jpg)](https://youtu.be/UXic_qg4fbo)

## 📌 Overview

**PredicTube** is a web service that leverages artificial intelligence to predict YouTube video performance based on title, thumbnail, and metadata *before* the video is uploaded.  
It also provides data-driven optimization suggestions, such as recommended titles and keyword insights, for creators and marketers.

---

## 🎯 Background & Motivation

- **YouTube’s Ubiquity**: 81% of Korea’s population watches YouTube monthly (KOSIS, 2022), making it a dominant platform for content and marketing.
- **Creator Saturation**: With increasing creators and limited viewer attention, titles and thumbnails have become crucial for competitiveness.
- **Lack of Objective Guidelines**: There are few tools that provide data-based support for optimizing these elements.

**PredicTube** helps creators and marketers make better decisions with AI-based performance prediction and analytics.

---

## 🧠 Target Users

- **YouTube Creators** seeking growth, engagement, and monetization  
- **Video Marketing Specialists** and **Brands** using YouTube as a promotional tool  

---

## 🧪 Key Features

### ✅ 1. Performance Prediction
- Predict video performance (view count range) based on title, thumbnail, subscriber count, and category.
- Input: title, thumbnail (image), subscriber count → Output: predicted view range.

### ✨ 2. AI-Based Title Suggestions
- Extracts core keywords from user input and generates 3 optimized titles using **ChatGPT API**.

### 🧾 3. History Tracking
- Saves each user’s past prediction attempts and results for comparison and refinement.

### 📊 4. Data Visualization
- Shows variable-wise correlation with view count.
- Includes "simple" and "detailed" views with toggle support.

### 🏷️ 5. Keyword Frequency Ranking
- Presents top-ranking keywords by category to support keyword planning and content ideation.

---

## 🏗️ System Architecture

- **Frontend**: JSP, HTML5, CSS3, JavaScript  
- **Backend**: Flask (Python), Tomcat  
- **Database**: MySQL  
- **AI Model**: Python (Keras, TensorFlow)  
- **APIs**:
  - YouTube Data API v3
  - Google Cloud Vision API (OCR, face detection, NSFW scoring)
  - ChatGPT API

---

## 🤖 AI Modeling Pipeline

- **Data Collection**:
  - ~100K videos crawled via YouTube Data API
  - OCR + face detection + safety detection via Google Cloud Vision API

- **Preprocessing**:
  - Tokenization, padding, stopword removal, text scaling, embedding

- **Model Design**:
  - **LSTM** for title & thumbnail text  
  - **MLP** for numerical metadata (subscriber count, length, faces, etc.)  
  - Combined **MIMO (Multi-Input Multi-Output)** architecture

- **Evaluation**:
  - Category-specific models
  - Hyperparameter tuning and visual performance comparison

---

## 🖥️ Web Features Preview

- **Main Page**
- **Google Social Login**
- **Channel ID Registration**
- **Thumbnail Upload via Drag & Drop**
- **Prediction Result Page**
- **Interactive Graphs & Keyword Rankings**
- **User History Modal with Thumbnail Previews**
- **Service Info & FAQ**
- **Bug Reporting Page**
- **Developer Intro Page**

---

## 🔍 Competitive Advantage

Compared to tools like **Noxinfluencer**:

| Feature                            | PredicTube | Noxinfluencer |
|-----------------------------------|------------|---------------|
| AI-based prediction               | ✅         | ❌            |
| Title optimization (AI-generated) | ✅         | ❌            |
| Thumbnail analysis (OCR/face)     | ✅         | ❌            |
| Keyword frequency analysis        | ✅         | ❌            |
| User history management           | ✅         | ❌            |

---

## 🚀 Future Plans

- **Beta Deployment**: Host the service externally and collect feedback.
- **Business Expansion**:
  - Paid version with improved AI model and advanced analytics
  - Collaboration with influencers and agencies
- **Use Cases**:
  - **Creators** for performance optimization  
  - **Brands** for ad campaign effectiveness  
  - **Researchers** for behavioral and psychological analysis

---

## 🔗 References

- [YouTube Data API](https://developers.google.com/youtube/v3/getting-started?hl=ko)  
- [Google Cloud Vision API](https://cloud.google.com/vision/docs/features-list?hl=ko)  
- [NLP with Deep Learning (WikiDocs)](https://wikidocs.net/book/2155)

---

## 👨‍💻 Contributors

| Name         | Role                                                       | GitHub |
|--------------|------------------------------------------------------------|--------|
| **Hanbin Im**     | Planning, Full-stack Dev, AI Modeling, UI/UX, API Integration | [@Hanbeeen](https://github.com/Hanbeeen) |
| **Jeong Jeonghoon** | Data Management, Visualization Design                        | –      |

---

## 📌 License

This repository is for educational and prototyping purposes.  
Commercial licensing inquiries welcome upon request.

