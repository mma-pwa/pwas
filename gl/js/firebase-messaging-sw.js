// // Import the functions you need from the SDKs you need
// importScripts("https://www.gstatic.com/firebasejs/10.10.0/firebase-app.js");
// // import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-analytics.js";
// importScripts("https://www.gstatic.com/firebasejs/10.10.0/firebase-messaging.js");
// // TODO: Add SDKs for Firebase products that you want to use
// // https://firebase.google.com/docs/web/setup#available-libraries
//
// initializeApp({
//     // 你的配置信息
//     'messagingSenderId': '831796329513'
// });

// 使用 ESM 风格的模块导入 Firebase 和 Messaging
// import { initializeApp } from 'https://www.gstatic.com/firebasejs/10.10.0/firebase-app.js';
// import { getMessaging, onBackgroundMessage } from 'https://www.gstatic.com/firebasejs/10.10.0/firebase-messaging-sw.js';

// const firebaseConfig = {
//     apiKey: "AIzaSyCo8Y6AaEiXFBKZVKzyY5cczBququijfww",
//     authDomain: "pwas-8ea9b.firebaseapp.com",
//     projectId: "pwas-8ea9b",
//     storageBucket: "pwas-8ea9b.appspot.com",
//     messagingSenderId: "831796329513",
//     appId: "1:831796329513:web:4ca8d069fe3d053595f038",
//     measurementId: "G-GBFZKWMQG0"
// };
// // 初始化 Firebase 应用
// const app = initializeApp(firebaseConfig);
//
// // 获取 Messaging 实例
// const messaging = getMessaging(app);
//
// // 监听后台消息
// onBackgroundMessage(messaging, (payload) => {
//     console.log('[firebase-messaging-sw.js] Received background message ', payload);
//     // 自定义通知的展示
// });