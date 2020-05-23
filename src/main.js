import App from './App.svelte';

const app = new App({
  target: document.body,
  props: {
    name: 'Nim and Svelte on Heroku'
  }
});

export default app;
