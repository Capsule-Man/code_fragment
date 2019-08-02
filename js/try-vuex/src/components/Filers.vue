<template>
  <div>
    <button v-on:click="changedValue({ param: '_limit', value: getRandomInt(10)})">Update</button>
    <ul>
      <li v-for="item in getFilers" v-bind:key="item.id">
        {{ item.filer }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Doc',
  data() {
      return {
      }
  },
  mounted() {
    this.changedValue({param: 'date', value: "2019-03-20"})
  },
  computed: {
      getFilers() {
        return this.$store.getters['edinet/getFilers']
      }
  },
  methods: {
      changedValue(input) {
        this.$store.dispatch('edinet/changedValue', input)
      },
      getRandomInt(max) {
        return Math.floor(Math.random() * Math.floor(max))
      }
  }
}
</script>

<style scoped>
</style>
