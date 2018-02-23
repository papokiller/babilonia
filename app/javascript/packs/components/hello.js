import { h } from "hyperapp";

const state = {
	count: 0
}
const actions = {
	up: value => state => ({ count: state.count + value })
}
const view = (state, actions) =>
  <div>
  	<h1>{state.count}</h1>
  	<button onclick={() => actions.up(1)}>+</button>
  </div>

export default { state, actions, view }