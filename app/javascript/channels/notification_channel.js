import consumer from "./consumer";

const initNotificationCable = () => {
  const notificationBadge = document.getElementById('notification');
  if (notificationBadge) {
    const id = notificationBadge.dataset.userId;

    consumer.subscriptions.create({ channel: "NotificationChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        document.body.insertAdjacentHTML("beforeend", data.template)
        notificationBadge.classList.remove('d-none')
      },
      connected(data) {
        console.log('connected', id);
      }
    });
  }
}

export { initNotificationCable };
