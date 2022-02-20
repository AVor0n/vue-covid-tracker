<script setup>
defineProps(["stats"]);

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>

<template>
  <div class="grid gap-4 md:grid-cols-2">
    <!-- Box 1 -->
    <div class="p-10 text-center bg-blue-100 rounded shadow-md">
      <h3 class="mb-4 text-3xl font-bold text-blue-900">Cases</h3>

      <div class="mb-4 text-2xl">
        <span class="font-bold">New:</span>
        {{ numberWithCommas(stats.NewConfirmed) }}
        <span class="font-bold">Total:</span>
        {{ numberWithCommas(stats.TotalConfirmed) }}
      </div>
    </div>

    <!-- Box 2 -->
    <div class="p-10 text-center bg-blue-200 rounded shadow-md">
      <h3 class="mb-4 text-3xl font-bold text-blue-900">Deaths</h3>

      <div class="mb-4 text-2xl">
        <span class="font-bold">New:</span>
        {{ numberWithCommas(stats.NewDeaths) }}
        <span class="font-bold">Total:</span>
        {{ numberWithCommas(stats.TotalDeaths) }}
      </div>
    </div>
  </div>
</template>
