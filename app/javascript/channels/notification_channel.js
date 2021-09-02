import consumer from "./consumer";

const initNotificationCable = () => {
  const navbarElement = document.getElementById('navbar');
  const messageBadge = document.getElementById('message-notification-badge');
  const requestBadge = document.getElementById('request-notification-badge');
  const userId = navbarElement.dataset.userId;
  if (userId && !window.notificationBadgeConnection) {
    debugger

    consumer.subscriptions.create({ channel: "NotificationChannel", id: userId }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        document.body.insertAdjacentHTML("beforeend", data.template)
        notificationBadge.innerText = data.notification_count
        notificationBadge.parentElement.classList.remove('d-none')
      },
      connected(data) {
        console.log('connected', userId);
        window.notificationBadgeConnection = true
      },
      disconnected(data) {
        console.log('connected', userId);
        window.notificationBadgeConnection = false
      }
    });
  }
}

export { initNotificationCable };
