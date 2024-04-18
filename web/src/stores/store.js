/* eslint-disable no-undef */
import { defineStore } from 'pinia'

export const useStore = defineStore('store', {
    state: () => ({
        
    }),
    actions: {
        SendMessage(endpoint, data) {
            fetch(`https://chalkboards/${endpoint}`, { method: 'POST', headers: { 'Content-Type': 'application/json; charset=UTF-8' }, body: JSON.stringify(data) })
        },
    },
})