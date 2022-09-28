importScripts('https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.10.1/firebase-messaging.js');

   const firebaseConfig = {
    apiKey: "AIzaSyBu9eAd26DVhQwFFcmnOuDHHm25tvApRUI",
    authDomain: "web-notification-e24ec.firebaseapp.com",
    projectId: "web-notification-e24ec",
    storageBucket: "web-notification-e24ec.appspot.com",
    messagingSenderId: "270162009803",
    appId: "1:270162009803:web:e0843a216355a655c4054e"
};
  firebase.initializeApp(firebaseConfig);
  
  const messaging = firebase.messaging();

  messaging.onBackgroundMessage((message) => {
    console.log("onBackgroundMessage", message);
    const notificationTitle = message.notification.title;
    const notificationOptions = {
      body: message.notification.body,
    };
    self.registration.showNotification(notificationTitle,
      notificationOptions);
  });