<template>
  <div class="relative p-1">
    <p class="absolute -top-1 left-5 bg-white px-2 text-gray-500">
      {{ label }}
    </p>
    <input
      class="rounded-xl w-full focus:outline-none p-4 border shadow-md"
      :type="type"
      @input="updateValue"
      :value="modelValue"
    />
  </div>
</template>

<script setup>
import { defineProps, defineEmits } from "vue";

const props = defineProps({
  label: {},
  type: {},
  modelValue: {},
});

const emit = defineEmits(["update:modelValue"]);

const updateValue = (event) => {
  emit("update:modelValue", event.target.value);
};
</script>
