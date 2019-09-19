<template>
  <div class="comment">
    <b>{{ author }} says: &nbsp;</b>
    <span>{{ content }}</span>
  </div>
</template>

<script>
export default {
  name: "Comment",
  props: ["author", "content"]
};
</script>