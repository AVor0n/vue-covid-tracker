<script setup>
import { reactive, computed } from "vue";
import loadingImage from "@/assets/loading.gif";

import dayjs from "dayjs";
import advancedFormat from "dayjs/plugin/advancedFormat.js";
dayjs.extend(advancedFormat);

import DataTitle from "@/components/DataTitle.vue";
import DataBoxes from "@/components/DataBoxes.vue";
import CountrySelect from "@/components/CountrySelect.vue";

const data = reactive({
  title: "Global",
  dataDate: "",
  stats: {},
  countries: [],
  loading: true,
});

const timestamp = computed(() => {
  return dayjs(data.dataDate).format("MMMM Do YYYY, h:mm:ss");
});

fetchCovidData();

function getCountryData(country) {
  data.stats = country;
  data.title = country.Country;
}

async function clearCountryData() {
  data.loading = true;
  await fetchCovidData();
  data.title = "Global";
}

async function fetchCovidData() {
  const res = await fetch("https://api.covid19api.com/summary");
  const json = await res.json();

  data.dataDate = json.Date;
  data.stats = json.Global;
  data.countries = json.Countries;
  data.loading = false;
}
</script>

<template>
  <main v-if="!data.loading">
    <DataTitle :text="data.title" :dataDate="timestamp" />

    <DataBoxes :stats="data.stats" />

    <CountrySelect @get-country="getCountryData" :countries="data.countries" />

    <button
      v-if="data.stats.Country"
      @click="clearCountryData"
      class="p-3 mb-10 text-white bg-green-700 rounded focus:outline-none hover:bg-green-600"
    >
      Clear Country
    </button>
  </main>

  <main class="flex flex-col justify-center text-center align-center" v-else>
    <div class="mt-10 mb-6 text-3xl text-gray-500">Fetching Data</div>
    <img :src="loadingImage" class="w-24 m-auto" alt="" />
  </main>
</template>
