export default () => {
  const searchClassListElement = (id) => document.querySelector(`#${id}.modal`).classList
  const open = (id) => searchClassListElement(id).add('is-active')
  const close = (id) => searchClassListElement(id).remove('is-active')
  const onCloseElement = (event) => close(event.target.parentNode.getAttribute('id'))
  const closeModalElement = document.querySelector('.modal .modal-close')
  closeModalElement && closeModalElement.addEventListener('click', onCloseElement)
  window.Modal =  { open, close }
}