<script setup>
import { ref } from "vue";
const props = defineProps(["countries"]);
const emit = defineEmits(["get-country"]);

const selected = ref(0);

function onChange() {
  const country = props.countries.find((item) => item.ID === selected.value);

  emit("get-country", country);
}
</script>

<template>
  <select
    @change="onChange"
    v-model="selected"
    class="block w-full p-3 my-10 border rounded form-select"
  >
    <option value="0">Select Country</option>
    <option v-for="country in countries" :value="country.ID" :key="country.ID">
      {{ country.Country }}
    </option>
  </select>
</template>
