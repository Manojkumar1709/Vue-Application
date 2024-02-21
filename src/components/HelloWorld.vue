<template>
  <div class="container">
    <h2>Hello, Welcome to Vue Application</h2>
    <p>This application is developed using Vue.js</p>
    <p id="datetime">{{ dateTime }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dateTime: ''
    };
  },
  mounted() {
    this.updateDateTime();
    setInterval(this.updateDateTime, 1000);
  },
  methods: {
    updateDateTime() {
      var currentDate = new Date();
      var formattedDate = currentDate.toLocaleDateString();
      var formattedTime = currentDate.toLocaleTimeString();
      this.dateTime = "Current Date: " + formattedDate + " | Current Time: " + formattedTime;
    }
  }
};
</script>

<style>
body {
  display: flex;
  justify-content: center;
  height: 100vh;
  margin: 0;
}

.container {
  text-align: center;
}

form {
  margin-top: 20px;
}
</style>
