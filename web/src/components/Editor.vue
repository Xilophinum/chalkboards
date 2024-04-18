<!-- eslint-disable vue/multi-word-component-names -->
<template>
	<div id="editor" v-show="showing">
		<q-editor
            dark
            v-model="content"
            style="height: 70%;"
            :definitions="{
                save: {
                    tip: 'Save!',
                    icon: 'fa-solid fa-save',
                    label: 'Save',
                    handler: saveWork
                },
                floorpreview: {
                    tip: 'Floor Stand',
                    icon: 'fa-solid fa-chalkboard',
                    label: 'Floor Stand',
                    handler: changeTemplate(1)
                },
                wallpreview: {
                    tip: 'Wall Bordered',
                    icon: 'fa-solid fa-chalkboard',
                    label: 'Wall Bordered',
                    handler: changeTemplate(2)
                },
                boxpreview: {
                    tip: 'Box',
                    icon: 'fa-solid fa-chalkboard',
                    label: 'Box',
                    handler: changeTemplate(3)
                },
                borderlesspreview: {
                    tip: 'Wall Borderless',
                    icon: 'fa-solid fa-chalkboard',
                    label: 'Wall Borderless',
                    handler: changeTemplate(4)
                }
            }"
            :toolbar="[
                ['bold', 'italic', 'underline', 'strike'],
                [
                    {
                        label: $q.lang.editor.formatting,
                        icon: $q.iconSet.editor.formatting,
                        list: 'no-icons',
                        options: [
                            'p',
                            'h1',
                            'h2',
                            'h3',
                            'h4',
                            'h5',
                            'h6',
                            'code'
                        ]
                    },
                    {
                        label: $q.lang.editor.fontSize,
                        icon: $q.iconSet.editor.fontSize,
                        fixedLabel: true,
                        fixedIcon: true,
                        list: 'no-icons',
                        options: [
                            'size-1',
                            'size-2',
                            'size-3',
                            'size-4',
                            'size-5',
                            'size-6',
                            'size-7'
                        ]
                    },
                    {
                        label: $q.lang.editor.defaultFont,
                        icon: $q.iconSet.editor.font,
                        fixedIcon: true,
                        list: 'no-icons',
                        options: [
                            'default_font',
                            'crumble',
                            'eraserd',
                            'eraserr',
                            'ppete',
                            'smudgie',
                            'thousand',
                            'thousandr',
                            'whatever'
                        ]
                    },
                ],
                ['save', 'floorpreview', 'wallpreview', 'boxpreview', 'borderlesspreview']
            ]"
            :fonts="{
                default_font: 'ColoredCrayons',
                crumble: 'CrayonCrumble',
                eraserd: 'EraserDust',
                eraserr: 'EraserRegular',
                ppete: 'Pencilpete',
                smudgie: 'SmudgieCrayon',
                thousand: 'Thousand',
                thousandr: 'ThousandRegular',
                whatever: 'WhateverItTakes'
            }"
        />
        <div id="preview" :style="{backgroundImage: getBGImage(), width: getWidth(), height: getHeight(), border: hasBorder() ? '3px solid tan' : ''}">
            <div v-html="content"></div>
        </div>
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
        saveWork: function() {
            this.showing = false
            this.store.SendMessage("savechalkboard", {content: this.content})
        },
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
        hasBorder() {
            return this.picTemplate == 1 || this.picTemplate == 2 || this.picTemplate == 3
        },
        changeTemplate: function(temp) {
            return () => this.picTemplate = temp
        }
    },
    mounted() {
		this.eventBus.on('editChalkboard', (data) => {
			this.showing = true
			this.content = data.content
		})
    },
    unmounted() {
		this.eventBus.off("editChalkboard");
    },
}
</script>

<style scoped>
#editor {
	position: absolute;
	top: 50%;
	left: 50%;
    transform: translate(-50%, -50%);
    width: 80%;
    height: 80%;
    display: flex;
    flex-flow: row nowrap;
    justify-content: space-around;
    align-items: center;
    color: white;
}
</style>
