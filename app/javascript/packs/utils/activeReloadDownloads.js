import Turbolinks from 'turbolinks'
export default () => {
  const isDownloadReload = document.querySelector('#download-list');
  const reloadDownloads = () => isDownloadReload && Turbolinks.visit()
  isDownloadReload && setTimeout(reloadDownloads, 3000)
}