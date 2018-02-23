import { app } from "hyperapp"
import components from './components/index.js'
import Turbolinks from 'turbolinks'
Turbolinks.start()
const render  = ({state, actions, view}, element) => app(state, actions, view, element)
document.addEventListener('turbolinks:load', () => {
	const componentsToRender = Array.from(document.querySelectorAll('*[data-component]'))
	componentsToRender.forEach((element) => {
		render(components[element.getAttribute('data-component')], element)
	})
})