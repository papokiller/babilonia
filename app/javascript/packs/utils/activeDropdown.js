export default () => {
	const dropdowns = document.querySelectorAll('.dropdown')
	Array.from(dropdowns).forEach((dropdown) => {
		dropdown.addEventListener('click', (event) => {
			const dropdownActive = document.querySelector('.dropdown.is-active')
			if (dropdownActive) { dropdownActive.classList.toggle('is-active') }
			dropdown.classList.toggle('is-active')
		})
	})
}