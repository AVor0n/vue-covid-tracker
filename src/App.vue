<script setup>
import { RouterView } from "vue-router";
import HeaderApp from "@/components/HeaderApp.vue";
import "@/index.css";
</script>

<template>
  <HeaderApp />
  <div class="container">
    <RouterView />
  </div>
</template>
