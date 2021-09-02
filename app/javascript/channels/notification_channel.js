import consumer from "./consumer";

const initNotificationCable = () => {
  const navbarElement = document.getElementById('navbar');
  const userId = navbarElement.dataset.userId;
  if (userId && !window.notificationBadgeConnection) {
    
    consumer.subscriptions.create({ channel: "NotificationChannel", id: userId }, {
      received(data) {
        const messageBadges = document.querySelectorAll('.message-notification-badge');
        const requestBadges = document.querySelectorAll('.request-notification-badge');
        console.log(data); // called when data is broadcast in the cable
        document.body.insertAdjacentHTML("beforeend", data.template)
        const requestsCount = data.notification_counters.requests_count
        const messagesCount = data.notification_counters.messages_count
        if (requestsCount !== 0) {
          requestBadges.forEach((badge) => { badge.innerText = requestsCount })
          requestBadges.forEach((badge) => { badge.parentElement.classList.remove('d-none') })
        }
        if (messagesCount !==0) {
          messageBadges.forEach((badge) => { badge.innerText = messagesCount })
          messageBadges.forEach((badge) => { badge.parentElement.classList.remove('d-none') })
        }
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
