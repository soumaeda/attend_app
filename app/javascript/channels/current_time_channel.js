import consumer from "./consumer"

consumer.subscriptions.create("CurrentTimeChannel", {
  connected() {
    console.log("Connected to the current time channel.")
  },

  disconnected() {
    console.log("Disconnected from the current time channel.")
  },

  received(data) {
    this.updateCurrentTime(data.time)
  },

  updateCurrentTime(time) {
    document.getElementById("current-time").innerHTML = time
  }
});