import consumer from "./consumer";

const initNotificationCable = () => {
  const notificationBadge = document.getElementById('notification');
  if (notificationBadge && !window.notificationBadgeConnection) {
    const id = notificationBadge.dataset.userId;

    consumer.subscriptions.create({ channel: "NotificationChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        document.body.insertAdjacentHTML("beforeend", data.template)
        notificationBadge.innerText = data.notification_count
        notificationBadge.parentElement.classList.remove('d-none')
      },
      connected(data) {
        console.log('connected', id);
        window.notificationBadgeConnection = true
      },
      disconnected(data) {
        console.log('connected', id);
        window.notificationBadgeConnection = false
      }
    });
  }
}

export { initNotificationCable };