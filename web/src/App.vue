<template>
    <div id="app">
		<Editor />
		<Chalkboards />
    </div>
</template>

<script>
import { useStore } from './stores/store'
import Chalkboards from './components/Chalkboards.vue'
import Editor from './components/Editor.vue';

export default {
	name: 'App',
	components: {
		Chalkboards,
		Editor
	},
	setup () {
        const store = useStore();
        return { store }
	},
	methods: {
		eventHandler: function(event) {
			this.eventBus.emit(event.data.action, event.data)
		},
	},
	mounted() {
		window.addEventListener("message", this.eventHandler);
		this.store.SendMessage("loaded", {})
	},
	unmounted() {
		window.removeEventListener("message", this.eventHandler);
	}
}
</script>

<style>

@font-face {
  font-family: 'ColoredCrayons';
  src: url('./assets/ColoredCrayons.ttf') format('truetype');
}
@font-face {
  font-family: 'CrayonCrumble';
  src: url('./assets/CrayonCrumble.ttf') format('truetype');
}
@font-face {
  font-family: 'EraserDust';
  src: url('./assets/EraserDust.ttf') format('truetype');
}
@font-face {
  font-family: 'EraserRegular';
  src: url('./assets/EraserRegular.ttf') format('truetype');
}
@font-face {
  font-family: 'Pencilpete';
  src: url('./assets/Pencilpete.ttf') format('truetype');
}
@font-face {
  font-family: 'SmudgieCrayon';
  src: url('./assets/SmudgieCrayon.ttf') format('truetype');
}
@font-face {
  font-family: 'ThousandRegular';
  src: url('./assets/ThousandRegular.ttf') format('truetype');
}
@font-face {
  font-family: 'Thousand';
  src: url('./assets/Thousand.ttf') format('truetype');
}
@font-face {
  font-family: 'WhateverItTakes';
  src: url('./assets/WhateverItTakes.ttf') format('truetype');
}

body, html {
	width: 100%;
	height: 100%;
}

::-webkit-scrollbar {
	width: 0px;
	background: transparent;
}
</style>