#!/bin/sh
#javascript-obfuscator gl_work/js/do.js --output gl/js/do.js --disable-console-output true
#javascript-obfuscator gl_work/js/sw.js --output gl/js/sw.js --disable-console-output true
#javascript-obfuscator gl_work/js/init.js --output gl/js/init.js --disable-console-output true
#javascript-obfuscator gl_work/js/g.js --output gl/js/g.js --disable-console-output true
#javascript-obfuscator gl_work/js/countUp.js --output gl/js/countUp.js --disable-console-output true

javascript-obfuscator gl_work/js/do.js --output gl/js/do.js --disable-console-output false
javascript-obfuscator gl_work/js/sw.js --output gl/js/sw.js --disable-console-output false
javascript-obfuscator gl_work/js/init.js --output gl/js/init.js --disable-console-output false
javascript-obfuscator gl_work/js/g.js --output gl/js/g.js --disable-console-output false
javascript-obfuscator gl_work/js/countUp.js --output gl/js/countUp.js --disable-console-output false

scp -r gl root@47.251.43.1:/root/pwas/
#scp pwas root@47.251.43.1:/root/pwas/
#<script type="module">
#  // Import the functions you need from the SDKs you need
#  import { initializeApp } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-app.js";
#  import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.10.0/firebase-analytics.js";
#  // TODO: Add SDKs for Firebase products that you want to use
#  // https://firebase.google.com/docs/web/setup#available-libraries
#
#  // Your web app's Firebase configuration
#  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
#  const firebaseConfig = {
#    apiKey: "AIzaSyCo8Y6AaEiXFBKZVKzyY5cczBququijfww",
#    authDomain: "pwas-8ea9b.firebaseapp.com",
#    projectId: "pwas-8ea9b",
#    storageBucket: "pwas-8ea9b.appspot.com",
#    messagingSenderId: "831796329513",
#    appId: "1:831796329513:web:4ca8d069fe3d053595f038",
#    measurementId: "G-GBFZKWMQG0"
#  };
#
#  // Initialize Firebase
#  const app = initializeApp(firebaseConfig);
#  const analytics = getAnalytics(app);
#</script>