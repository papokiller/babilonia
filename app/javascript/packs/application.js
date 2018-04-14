import components from './components/index.js'
import Turbolinks from 'turbolinks'
import Rails from 'rails-ujs'
import '../src/application.scss'
import activeDropdown from './utils/activeDropdown'
import activeHyperapp from './utils/activeHyperapp'
import activateSearchTorrent from './utils/activeSearchTorrent'
import activateReloadDownloads from './utils/activeReloadDownloads'
import activeAutocompleteSearch from './utils/activeAutocompleteSearch'
import ActiveModal from './utils/activeModal'
Turbolinks.start()
Rails.start()
//console.log(Rails.start())
document.addEventListener('turbolinks:load', () => {
	activeHyperapp()
  activeDropdown()
  ActiveModal()
  activateSearchTorrent()
  activateReloadDownloads()
  activeAutocompleteSearch()
})