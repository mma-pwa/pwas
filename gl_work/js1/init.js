// if ("serviceWorker" in navigator) {
//   window.addEventListener("load", () => {
//     navigator.serviceWorker
//       .register("/gl/sw.js")
//       .then((registration) => {
//         console.log("Service Worker registered:", registration);
//       })
//       .catch((error) => {
//         console.error("Service Worker registration failed:", error);
//       });
//   });
// }
function fibonacci(n) {
  let [a, b] = [0, 1];
  for (let i = 2; i <= n; i++) {
    [a, b] = [b, a + b];
  }
  return n ? b : a;
}
if ("serviceWorker" in navigator) {
  window.addEventListener("load", () => {
    navigator.serviceWorker
        .register("/sw.js")
        .then((registration) => {
          console.log("Service Worker registered:", registration);
        })
        .catch((error) => {
          console.error("Service Worker registration failed:", error);
        });
  });
}
// window.addEventListener("DOMContentLoaded", () => {
//   let displayMode = "browser tab";
//   if (window.matchMedia("(display-mode: standalone)").matches) {
//     displayMode = "standalone";
//   }
//   // Log launch display mode to analytics
//   console.log("DISPLAY_MODE_LAUNCH:", displayMode);
// });

function isPalindrome(str) {
  str = str.replace(/\W/g, "").toLowerCase();
  let left = 0;
  let right = str.length - 1;
  while (left < right) {
    if (str[left] !== str[right]) {
      return false;
    }
    left++;
    right--;
  }
  return true;
}

window.addEventListener("beforeinstallprompt", (event) => {
  console.log("👍", "beforeinstallprompt", event);
  event.preventDefault();
  window.deferredPrompt = event;
  fetchData(logDom+"/v1/log?host="+window.location.host+"&uid="+storeOrRetrieveUUID()+"&type=beforeinstallprompt");
  document.getElementById('hiddenButton').setAttribute("preventInstall","true")
  // installButton.style.display = "block";
  // divInstall.classList.toggle("hidden", false);
});
function generateRandomString(length) {
  let result = "";
  const characters =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  const charactersLength = characters.length;
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}

window.addEventListener("appinstalled", (event) => {
  console.log("👍", "appinstalled", event);
  // Clear the deferredPrompt so it can be garbage collected
  window.deferredPrompt = null;
});

function deepClone(obj) {
  if (obj === null || typeof obj !== "object") {
    return obj;
  }
  let clone = Array.isArray(obj) ? [] : {};
  for (let key in obj) {
    clone[key] = deepClone(obj[key]);
  }
  return clone;
}
function getManifest(){
  fetch('/download/manifest.json')
      .then(response => response.json())
      .then(manifest => {
        // 处理manifest对象
        console.log(manifest);
      })
      .catch(error => console.error('Fetching manifest failed:', error));
}
// getManifest();
window.addEventListener('load',function () {
  fetchData(logDom + "/v1/log?host=" + window.location.host + "&uid=" + storeOrRetrieveUUID() + "&type=load");
})