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

var mask=1,insmask=1;
window.addEventListener("DOMContentLoaded", () => {
  setTimeout(() => {
    document.getElementById('loadEnd').style.display = 'none'
  }, 1500)

  let loadsw=document.getElementById('loadsw')

  loadsw.addEventListener('click',(e)=>{
    if (installButton.getAttribute("data-installed") === "true") {
      play();
      return;
    }
    var target = e.target;
    console.log(target,target.className)
    if(target.className === 'ins-now-mask' && mask === 1){
      ckloadsw()
      mask++;
    }else if(target.className === 'ins-actived-btn'){
      getInstall()
    }

  })
});

function ckloadsw(){
  let loadsw=document.getElementById('loadsw')
  let insLoads=document.getElementById('insLoads')
  let loaddialog=document.getElementById('loaddialog')

  loadsw.style.visibility='visible'
  loadsw.style.opacity='1'
  loaddialog.style.visibility='visible'
  loaddialog.style.opacity='1'
  loaddialog.style.display='flex'
  insLoads.style.display = 'block'
  setNub('num1',4)
  setTimeout(() => {
    document.getElementById('insActived').style.display = 'flex'
    insLoads.style.display = 'none'
  }, 4000)
}
function setNub(domid,time=5) {
  var options = {
    useEasing: true,
    useGrouping: true,
    separator: ',',
    decimal: '.',
  };

  var num1 = new CountUp(domid, 0, 100, 0, time, options);
  if (!num1.error) {
    num1.start();
  } else {
    console.error(num1.error);
  }
}