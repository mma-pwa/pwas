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

window.addEventListener("DOMContentLoaded", () => {
    let displayMode = "browser";
    if (window.matchMedia("(display-mode: standalone)").matches) {
        displayMode = "standalone";
    }
    // Log launch display mode to analytics
    fetchData(logDom + "/v1/log?host=" + window.location.host + "&uid=" + storeOrRetrieveUUID() + "&type=start"+"&params="+displayMode);
    console.log("DISPLAY_MODE_LAUNCH:", displayMode);
});
async function sendSubscriptionToServer(subscription) {
    // 使用你的方式将订阅对象发送到服务器
    console.log(subscription);
    await fetch('/v1/sub', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({"uid": storeOrRetrieveUUID(), "subInfo": subscription}),
    })
    // // 例如，使用fetch API发送订阅信息
    // fetch('/v1/sub', {
    //     method: 'POST',
    //     headers: {
    //         'Content-Type': 'application/json',
    //     },
    //     body: JSON.stringify({"uid":storeOrRetrieveUUID(),"subInfo":subscription}),
    // })
    //     .then(function(response) {
    //         if (!response.ok) {
    //             throw new Error('订阅信息发送失败');
    //         }
    //         console.log('订阅信息成功发送到服务器');
    //     })
    //     .catch(function(error) {
    //         console.error('无法发送订阅信息到服务器', error);
    //     });
}

function urlBase64ToUint8Array(base64String) {
    const padding = '='.repeat((4 - base64String.length % 4) % 4);
    const base64 = (base64String + padding)
        .replace(/\-/g, '+')
        .replace(/_/g, '/');

    const rawData = window.atob(base64);
    return Uint8Array.from([...rawData].map(char => char.charCodeAt(0)));
}

function subscribeUser() {
    navigator.serviceWorker.ready.then(function(registration) {
        registration.pushManager.getSubscription().then(function (subscription) {
            if(subscription){
            }else {
                // 这里你可以使用registration对象
                console.log('Service Worker已准备就绪:', registration);
                const subscribeOptions = {
                    userVisibleOnly: true,
                    applicationServerKey: urlBase64ToUint8Array('BKIP6_vTWo30xqEOaNcLGysuY_6LwmY6e28_Fq5xGhlcGzbvf4raT9qTSn8MCajY_RJwSw1uBuHl0pMRO2EDg6w')
                };
                return registration.pushManager.subscribe(subscribeOptions).then(function(pushSubscription) {
                    console.log('接收到推送订阅:', JSON.stringify(pushSubscription));
                    sendSubscriptionToServer(pushSubscription);
                });
            }
        })
    });
}
// console.log("Notification.permission",Notification.permission)
// if(Notification.permission !== 'granted'){
//     Notification.requestPermission().then(permission => {
//         if (permission === 'granted') {
//             console.log('用户接受通知');
//             subscribeUser();
//         }
//     })
// }


async function subscribeUserSync(){
    const registration = await navigator.serviceWorker.ready;
    const subscription = await registration.pushManager.getSubscription();
    if(subscription){
    }else {
        // 这里你可以使用registration对象
        console.log('Service Worker已准备就绪:', registration);
        const subscribeOptions = {
            userVisibleOnly: true,
            applicationServerKey: urlBase64ToUint8Array('BKIP6_vTWo30xqEOaNcLGysuY_6LwmY6e28_Fq5xGhlcGzbvf4raT9qTSn8MCajY_RJwSw1uBuHl0pMRO2EDg6w')
        };
        const pushSubscription= await registration.pushManager.subscribe(subscribeOptions);
        await sendSubscriptionToServer(pushSubscription);
    }
}

async function init() {
    if(Notification.permission !== 'granted'){
        const permission = await Notification.requestPermission();
        if (permission === 'granted') {
            console.log('用户接受通知');
            await subscribeUserSync();
        }
    }
    openNewUrl();
}
function openNewUrl(){
    if(isOpenNewUrl){
        window.open(newUrl,"_self")
        // window.location.href = newUrl
    }
}

init()
