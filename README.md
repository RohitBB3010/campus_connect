# 🎓 College Committee Collaboration Platform

A centralized platform designed to enhance collaboration between college committees by streamlining communication, event planning, and activity management. The system enables organized, secure, and efficient coordination using a robust role-based access model.

---

## ✨ Features

- 📣 **Announcements:** Committee Heads can share important updates in real-time  
- 📅 **Shared Event Calendar:** Prevent scheduling conflicts with a unified calendar view  
- ✅ **RSVP & Event Management:** Members can confirm participation, view event details, or manage events  
- 🛡️ **Role-Based Access Control:** 
  - **Heads** – Manage events, announcements, and members  
  - **Members** – View events, announcements, and participate  
  - **Extended Members** – Limited visibility for broader communication  

---

## 📂 Folder Structure
college-committee-platform/
├── frontend/ # Built using Flutter
└── backend/ # Node.js + Express + MongoDB


---

## ⚙️ Tech Stack

| Layer              | Technologies                                                                                      |
|-------------------|---------------------------------------------------------------------------------------------------|
| **Frontend**       | <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg" width="40" height="40" alt="Flutter" /> |
| **Backend**        | <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg" width="40" height="40" alt="Node.js" /> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/express/express-original.svg" width="40" height="40" alt="Express" /> |
| **Database**       | <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mongodb/mongodb-original.svg" width="40" height="40" alt="MongoDB" /> |
| **Authentication** | <img src="https://img.icons8.com/color/48/000000/jwt.png" width="40" height="40" alt="JWT" /> |
| **Version Control**| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" width="40" height="40" alt="Git" /> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" width="40" height="40" alt="GitHub" /> |

---

## 🚀 Getting Started

### 🖥️ Backend Setup

```bash
cd backend
npm install
npm start
```

##Make sure to setup your .env like this : 
MONGO_URI=your-mongodb-uri
JWT_SECRET=your-secret
PORT=5000

### 📱 Frontend Setup

```bash
cd frontend
flutter pub get
flutter run
```
