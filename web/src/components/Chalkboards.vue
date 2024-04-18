<!-- eslint-disable vue/multi-word-component-names -->
<template>
	<div id="chalkboard" v-show="showing" :style="{backgroundImage: getBGImage(), width: getWidth(), height: getHeight()}">
		<div v-html="content" />
	</div>
</template>

<script>
import { useStore } from '../stores/store'
import img1 from '../assets/black_template1.png'
import img2 from '../assets/black_template2.png'
import img3 from '../assets/black_template3.png'
import img4 from '../assets/black_template4.png'

export default {
	components: {
		
	},
	setup () {
        const store = useStore();
		return {
            store
		}
	},
	data() {
		return {
			showing: false,
			content: "",
			picTemplate: 1,
		}
	},
    computed: {

    },
	methods: {
        getBGImage() {
            switch (this.picTemplate) {
                case 1:
                    return `url(${img1})`
                case 2:
                    return `url(${img2})`
                case 3:
                    return `url(${img3})`
                case 4:
                    return `url(${img4})`
            }
		},
		getWidth() {
            switch (this.picTemplate) {
                case 1:
                    return "256px"
                case 2:
                    return "512px"
                case 3:
                    return "256px"
                case 4:
                    return "256px"
            }
		},
		getHeight() {
            switch (this.picTemplate) {
                case 1:
                    return "512px"
                case 2:
                    return "256px"
                case 3:
                    return "256px"
                case 4:
                    return "512px"
            }
		},
    },
    mounted() {
		this.eventBus.on('chalkboard', (data) => {
			this.showing = true
			this.content = data.content
			this.picTemplate = data.picTemplate
		})
		this.eventBus.on('clearchalkboard', () => {
			this.showing = false
			this.content = ""
			this.picTemplate = 1
		})
    },
    unmounted() {
		this.eventBus.off("chalkboard");
		this.eventBus.off("clearchalkboard");
    },
}
</script>

<style scoped>
#chalkboard {
	position: absolute;
	top: 0;
	left: 0;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	color: white;
}
</style>
