importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "...",
  authDomain: "...",
  databaseURL: "...",
  projectId: "...",
  storageBucket: "...",
  messagingSenderId: "...",
  appId: "...",
});


const messaging = firebase.messaging();
// Optional:
messaging.onBackgroundMessage((payload) => {
  console.log(
      '[firebase-messaging-sw.js] Received background message ',
      payload.notification
  );
});

// const notificationTitle = payload.notification.title;
// const notificationOptions = {
  // body: payload.notification.body,
// };
//
//   self.registration.showNotification(notificationTitle, notificationOptions);
// });
