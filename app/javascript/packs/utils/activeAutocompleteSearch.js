import axios from 'axios'

const CancelToken = axios.CancelToken
let source = CancelToken.source()
const cancelPreviusRequest = () => {
  source.cancel()
  source = CancelToken.source()
}
export default () => {
  const suggestions = document.querySelector('.suggestions ul')
  const clearSuggestions = () => Array.from(suggestions.children).forEach((e) => e.remove())
  const setSuggestions = (data) => {
    data.forEach((s) => {
      const suggestion = document.createElement('li')
      const suggestionText = document.createTextNode(s)
      suggestion.appendChild(suggestionText)
      suggestions.appendChild(suggestion)
    })
  }
  if (suggestions) {
    const getAutoComplete = async (keyword) => {
      suggestions.parentNode.style.display = 'block'
      clearSuggestions()
      const endpoint = `/search/suggestions/${encodeURI(keyword)}`
      const data = await axios.get(endpoint, { cancelToken: source.token })
      setSuggestions(data.data.data)
    }
    const checkAutoComplete = (e) => {
      if (e.target.value.length > 1) {
        cancelPreviusRequest()
        getAutoComplete(e.target.value)
      } else {
        clearSuggestions()
      }
    }
    const search = document.querySelector('#search-home')
    search.addEventListener('keyup', checkAutoComplete)
  }
}