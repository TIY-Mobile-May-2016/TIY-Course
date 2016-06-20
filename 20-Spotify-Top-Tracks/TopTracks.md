

Create smart Data Model objects for:

Album

func fetchAlbums(artistID: String)

let urlString = "https://api.spotify.com/v1/artists/\(artistID)/albums"



Related Artists

func fetchRelatedArtists(artistID: String)

let urlString = "https://api.spotify.com/v1/artists/\(artistID)/related-artists"
