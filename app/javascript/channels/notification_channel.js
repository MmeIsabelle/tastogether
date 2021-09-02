import consumer from "./consumer";

const initNotificationCable = () => {
  const navbarElement = document.getElementById('navbar');
  const userId = navbarElement.dataset.userId;
  if (userId && !window.notificationBadgeConnection) {
    const messageBadges = document.querySelectorAll('.message-notification-badge');
    const requestBadges = document.querySelectorAll('.request-notification-badge');

    consumer.subscriptions.create({ channel: "NotificationChannel", id: userId }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        document.body.insertAdjacentHTML("beforeend", data.template)

        const requestsCount = data.notification_counters.requests_count
        const messagesCount = data.notification_counters.messages_count
        requestBadges.forEach((badge) => { badge.innerText = requestsCount })
        messageBadges.forEach((badge) => { badge.innerText = messagesCount })
        requestBadges.forEach((badge) => { badge.parentElement.classList.remove('d-none') })
        messageBadges.forEach((badge) => { badge.parentElement.classList.remove('d-none') })
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
