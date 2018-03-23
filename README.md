# Babilonia
  with whom the kings of the earth  and the earth’s inhabitants got drunk with the wine of her immorality.

# Development
  the development and deploy of this application is thinking to use only docker

# Running the app on development
  * create database
  `docker-compose run web rails db:create`
  * run migrations
  `docker-compose run web rails db:migrate`
  * run tests
  `docker-compose run web rspec`
  * run server
  `docker-compose up`

   Web server port: ***3000***
   Transmission web port: ***9091***


# Todo
- [x] Support Downloads Torrent with transmission
- [x] Support List Torrents transmission
- [x] Support List Torrents transmission
- [x] Support Search Torrent EZTV
- [x] Support Create Collection
- [x] Dashboard monitor torrent
- [ ] nested collections
- [ ] Search Torrent YTS
- [ ] Search Torrent thepiratebay
- [ ] Search Torrent with IMDB
- [ ] Support Remove Torrent
- [ ] Support reupload torrent downloaded
- [x] Support docker(development)
- [ ] Support docker(production)
- Add Tests(in process)

