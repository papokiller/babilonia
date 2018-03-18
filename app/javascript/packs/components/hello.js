import { h } from "hyperapp";

const state = {
	gon: () => gon.collection
}
const actions = {
  collection: () => gon.collection,
	up: value => (state, actions) => {
    console.log(state.gon())
  }
}



const view = (state, actions) =>
  <div>
  	<h1>{state.count}</h1>
  	<input value={state.gon().name} />
    <button onclick={() => actions.up()}>ok</button>
  </div>

export default { state, actions, view }