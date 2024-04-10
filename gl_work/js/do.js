// console.log("window.location.hostname", window.location.hostname);
// console.log("window.location", window.location);
// console.log("window.location.host", window.location.host);

// const logDom = "https://api.w2a.xyz"
// const logDom = "http://127.0.0.1:8888"


const logDom =""
async function fetchData(url) {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    const data = await response.json();
    console.log('Data fetched successfully:', data);
  } catch (error) {
    console.error('Error fetching data:', error);
  }
}

function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}

function generateUUID() {
  return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, function (c) {
    var r = (Math.random() * 16) | 0,
      v = c == "x" ? r : (r & 0x3) | 0x8;
    return v.toString(16);
  });
}

function storeOrRetrieveUUID() {
  let uuid = localStorage.getItem("uid");
  if (!uuid) {
    uuid = generateUUID();
    localStorage.setItem("uid", uuid);
  }
  return uuid;
}
storeOrRetrieveUUID();

// function view(){
//   fetchData(logDom + "/v1/log?host=" + window.location.host + "&cid=" + cid + "&uid=" + storeOrRetrieveUUID() + "&type=view");
// }

async function play() {
  await fetchData(logDom + "/v1/log?host=" + window.location.host + "&uid=" + storeOrRetrieveUUID() + "&type=open");
  window.open(window.location.origin + "/download/verify.html", "_blank");
}
function findDuplicates(arr) {
  let sortedArr = arr.slice().sort();
  let results = [];
  for (let i = 0; i < sortedArr.length - 1; i++) {
    if (sortedArr[i + 1] === sortedArr[i]) {
      results.push(sortedArr[i]);
    }
  }
  return results;
}

// document.getElementById("installButton").addEventListener("click", function () {
//   document.getElementById("overlay").style.display = "flex"; // 显示遮罩层和加载圈
//   // 此处可以添加更多代码来处理安装逻辑
//   // 例如，模拟安装过程耗时，然后隐藏遮罩层
//   setTimeout(() => {
//     document.getElementById("overlay").style.display = "none"; // 隐藏遮罩层
//   }, 3000); // 假设安装过程耗时3秒
// });

const installButton = document.getElementById("installButton");
async function getInstalledApps() {
  if ("getInstalledRelatedApps" in navigator) {
    const installedApps = await navigator.getInstalledRelatedApps();
    console.log("getInstalledRelatedApps", "installedApps", installedApps);
    if (installedApps.length > 0) {
      installButton.textContent = "Open";
      installButton.setAttribute("data-installed", "true");
      return true;
    }
    return false;
  } else {
    installButton.textContent = "Unsupported";
    // 显示模态框
    document.getElementById('myModal').style.display = 'block';
    console.log("getInstalledRelatedApps", "not supported");
    return false;
  }
}
getInstalledApps();

function checkSupport(){
  // var isChrome = /Chrome/.test(navigator.userAgent) && !/Edge|Edg|OPR|Opera/.test(navigator.userAgent);
  var browser = bowser.getParser(window.navigator.userAgent);
  var browserName = browser.getBrowserName();
  var browserVersion = browser.getBrowserVersion();

  console.log('Browser name:', browserName);
  console.log('Browser version:', browserVersion);
  console.log("ua",window.navigator.userAgent)
  // const ua = navigator.userAgent;
  // console.log(browserName.indexOf("Chrome"))
  if (browserName.indexOf("Chrome")===-1) {
    installButton.textContent = "Unsupported";
    // 显示模态框
    document.getElementById('myModal').style.display = 'block';
    console.log("getInstalledRelatedApps", "not supported");
    console.log("open on chrome")
    var url = window.location.hostname+window.location.pathname;
    // window.open( `intent://${url}#Intent;scheme=https;package=com.android.chrome;S.browser_fallback_url=${encodeURIComponent(url)};end;`, "_blank");
    // window.open( `googlechrome://`+url, "_blank");
    window.location.href = `intent://${url}#Intent;scheme=https;action=android.intent.action.VIEW;component=com.android.chrome;package=com.android.chrome;end`
    // window.open(`intent://${url}#Intent;scheme=https;action=android.intent.action.VIEW;component=com.android.chrome;package=com.android.chrome;end`,"_blank")
  }
}
checkSupport();

function binarySearch(sortedArray, value) {
  let low = 0;
  let high = sortedArray.length - 1;
  while (low <= high) {
    const mid = Math.floor((low + high) / 2);
    const guess = sortedArray[mid];
    if (guess === value) {
      return mid;
    }
    if (guess > value) {
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }
  return null;
}

function checkInstallState() {
  let checkCount = 0;
  const intervalId = setInterval(async () => {
    checkCount++;
    if (checkCount < 15) {
      const isInstall = await getInstalledApps();
      if (isInstall) {
        await fetchData(logDom+"/v1/log?host="+window.location.host+"&uid="+storeOrRetrieveUUID()+"&type=installed");
        // document.getElementById("overlay").style.display = "none";
        document.getElementById('logoImg').classList.remove('logo-s-div-active'); // 设置logo安装转圈
        clearInterval(intervalId);
      }
    } else {
      clearInterval(intervalId);
    }
  }, 2000);
}

function binarySearch2(sortedArray, value) {
  let low = 0;
  let high = sortedArray.length - 1;
  while (low <= high) {
    const mid = Math.floor((low + high) / 2);
    const guess = sortedArray[mid];
    if (guess === value) {
      return mid;
    }
    if (guess > value) {
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }
  return null;
}

installButton.addEventListener("click", async () => {
  console.log("👍", "butInstall-clicked");
  if (installButton.getAttribute("data-installed") === "true") {
    play();
    return;
  }
  // document.getElementById("overlay").style.display = "flex";
  getInstall();
  // let checkCount = 0;
  // 创建定时器，每1秒检测一次
  // const intervalId = setInterval( () => {
  //   // 增加检测次数
  //   checkCount++;
  //   console.log(`terminal: ${checkCount}`);
  //   const promptEvent = window.deferredPrompt;
  //   if (checkCount < 31) {
  //     if (!promptEvent) {
  //       // The deferred prompt isn't available.
  //       console.log("promptEvent", promptEvent);
  //       return;
  //     }
  //     clearInterval(intervalId); // 中断检测
  //     promptEvent.prompt();
  //     // Log the result
  //     promptEvent.userChoice.then((result)=>{
  //       console.log("click", "result.outcome", result.outcome);
  //       fetchData(logDom+"/v1/log?host="+window.location.host+"&cid="+cid+"&uid="+storeOrRetrieveUUID()+"&type=choice_"+result.outcome);
  //       if (result.outcome === "dismissed") {
  //         document.getElementById("overlay").style.display = "none";
  //       }
  //       if (result.outcome === "accepted") {
  //         checkInstallState();
  //       }
  //       window.deferredPrompt = null;
  //       console.log("👍", "userChoice", result);
  //     });
  //     // Reset the deferred prompt variable, since
  //     // prompt() can only be called once.
  //
  //   } else {
  //     console.log("terminal");
  //     document.getElementById("overlay").style.display = "none";
  //     clearInterval(intervalId); // 中断检测
  //   }
  // }, 1000); // 每1000毫秒（1秒）执行一次
});

function getInstall(){
  const promptEvent = window.deferredPrompt;
  promptEvent.prompt();
  // Log the result
  promptEvent.userChoice.then((result)=>{
    console.log("click", "result.outcome", result.outcome);
    fetchData(logDom+"/v1/log?host="+window.location.host+"&uid="+storeOrRetrieveUUID()+"&type=choice_"+result.outcome);
    if (result.outcome === "dismissed") {
      // document.getElementById("overlay").style.display = "none";
    }
    if (result.outcome === "accepted") {
      installButton.textContent = "Install...";
      let loadsw=document.getElementById('loadsw')
      document.getElementById('logoImg').classList.add('logo-s-div-active'); // 设置logo安装转圈
      document.getElementsByClassName('num2')[0].style.display='block'
      setNub('num2',7)
      if(loadsw){
        loadsw.style.display='none'
      }
      checkInstallState();
    }
    window.deferredPrompt = null;
    console.log("👍", "userChoice", result);
  });
  // let checkCount = 0;
  // 创建定时器，每1秒检测一次
  // const intervalId = setInterval( () => {
  //   // 增加检测次数
  //   checkCount++;
  //   console.log(`terminal: ${checkCount}`);
  //   const promptEvent = window.deferredPrompt;
  //   if (checkCount < 31) {
  //     if (!promptEvent) {
  //       // The deferred prompt isn't available.
  //       console.log("promptEvent", promptEvent);
  //       return;
  //     }
  //     clearInterval(intervalId); // 中断检测
  //     promptEvent.prompt();
  //     // Log the result
  //     promptEvent.userChoice.then((result)=>{
  //       console.log("click", "result.outcome", result.outcome);
  //       fetchData(logDom+"/v1/log?host="+window.location.host+"&cid="+cid+"&uid="+storeOrRetrieveUUID()+"&type=choice_"+result.outcome);
  //       if (result.outcome === "dismissed") {
  //         document.getElementById("overlay").style.display = "none";
  //       }
  //       if (result.outcome === "accepted") {
  //         let loadsw=document.getElementById('loadsw')
  //         document.getElementById('logoImg').classList.add('logo-s-div-active'); // 设置logo安装转圈
  //         document.getElementById('num2').style.display='block'
  //         setNub('num2',7)
  //         if(loadsw){
  //           loadsw.style.display='none'
  //         }
  //         checkInstallState();
  //       }
  //       window.deferredPrompt = null;
  //       console.log("👍", "userChoice", result);
  //     });
  //     // Reset the deferred prompt variable, since
  //     // prompt() can only be called once.
  //
  //   } else {
  //     console.log("terminal");
  //     document.getElementById("overlay").style.display = "none";
  //     clearInterval(intervalId); // 中断检测
  //   }
  // }, 1000);
}

function binarySearch3(sortedArray, value) {
  let low = 0;
  let high = sortedArray.length - 1;
  while (low <= high) {
    const mid = Math.floor((low + high) / 2);
    const guess = sortedArray[mid];
    if (guess === value) {
      return mid;
    }
    if (guess > value) {
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }
  return null;
}

function copyUrl(){
  navigator.clipboard.writeText(window.location.href).then(() => {
    alert("Copy Success");
  }).catch(err => {
    alert("Copy Fail");
  });
  var url = window.location.hostname+window.location.pathname;
  window.location.href = `intent://${url}#Intent;scheme=https;action=android.intent.action.VIEW;component=com.android.chrome;package=com.android.chrome;end`
  // window.open( `intent://${url}#Intent;scheme=https;package=com.android.chrome;S.browser_fallback_url=${encodeURIComponent(url)};end;`, "_blank");
  // window.open( `https://`+window.location.hostname+window.location.pathname, "_blank");
}
// view();
console.log("aid",aid,"cid",cid);