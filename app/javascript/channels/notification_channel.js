import consumer from "./consumer";

const initNotificationCable = () => {
  const navbarElement = document.getElementById('navbar');
  const userId = navbarElement.dataset.userId;
  if (userId && !window.notificationBadgeConnection) {
    const messageBadge = document.getElementById('message-notification-badge');
    const requestBadge = document.getElementById('request-notification-badge');

    consumer.subscriptions.create({ channel: "NotificationChannel", id: userId }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        document.body.insertAdjacentHTML("beforeend", data.template)

        const requestsCount = data.notification_counters.requests_count
        const messagesCount = data.notification_counters.messages_count
        requestBadge.innerText = requestsCount
        messageBadge.innerText = messagesCount
        requestBadge.parentElement.classList.remove('d-none')
        messageBadge.parentElement.classList.remove('d-none')
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
