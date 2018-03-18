import { app, h } from 'hyperapp'
import components from '../components/index'
const render  = ({state, actions, view}, element) => app(state, actions, view, element)
export default () => {
	const componentsToRender = Array.from(document.querySelectorAll('*[data-component]'))
	componentsToRender.forEach((element) => {
		render(components[element.getAttribute('data-component')], element)
	})
}