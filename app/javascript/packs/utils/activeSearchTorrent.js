import Turbolinks from 'turbolinks'
export default () => {
  const searchTorrentsElement = document.querySelector('#search-torrents')
  const onKeyPress = (event) => {
    const search = () => Turbolinks.visit(`/search/${encodeURI(searchTorrentsElement.value)}`)
    if (event.code === 'Enter') { search() }
  }
  searchTorrentsElement && searchTorrentsElement.addEventListener('keypress', onKeyPress)
}