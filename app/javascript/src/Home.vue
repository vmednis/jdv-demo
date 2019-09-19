<template>
  <div id="home">
    <h1>Hello!</h1>
    <p>What do you think about this setup?</p>
    <form @submit.prevent="onComment">
      <input type="text" placeholder="Name" v-model="formAuthor" />
      <br />
      <textarea placeholder="Comment" v-model="formContents" />
      <br />
      <button type="submit">Post!</button>
    </form>
    <comment
      v-for="comment in comments"
      v-bind:key="comment.id"
      v-bind:author="comment.author"
      v-bind:content="comment.content"
    />
  </div>
</template>

<script>
import Comment from "./components/Comment.vue";

export default {
  name: "Home",
  components: {
    Comment
  },
  data() {
    return {
      formAuthor: "",
      formContents: "",
      comments: []
    };
  },
  mounted() {
    console.log(process.env.JETS_HOST);
    this.axios
      .get("/api/v1/comments")
      .then(response => {
        this.comments = response.data.comments;
      });
  },
  methods: {
    onComment() {
      let params = {
        author: this.formAuthor,
        content: this.formContents
      };

      this.axios
        .post("/api/v1/comments", params)
        .then(response => {
          location.reload();
        });
    }
  }
};
</script>>