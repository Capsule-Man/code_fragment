<template>
  <div id="app">
    <h1>EDINET</h1>
    <Filers />
  </div>
</template>

<script>
import Filers from './components/Filers.vue'


export default {
  name: 'app',
  components: {
    Filers
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
