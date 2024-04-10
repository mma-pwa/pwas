// This code executes in its own worker or thread
const CACHE_NAME="cache_v1"
self.addEventListener("install",  (event) => {
  console.log("Service worker installed", event);

});
self.addEventListener("activate", (event) => {
  console.log("Service worker activated", event);
  // event.waitUntil(self.clients.claim());
});
self.addEventListener("fetch", (event) => {
  // console.log("Service worker fetch", event);
  console.log(`URL requested: ${event.request.url}`);
  // event.respondWith(
  //     caches.match(event.request)
  //         .then(cachedResponse => {
  //               // It can update the cache to serve updated content on the next request
  //               return cachedResponse || fetch(event.request);
  //             }
  //         ))
});
self.addEventListener('push', function(event) {
  console.log("push",event.data)
  // const data = event.data.json();
  // self.registration.showNotification(data.title, {
  //   body: data.body,
  //   icon: data.icon
  // });
});