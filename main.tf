terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.7"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_track" "aerodynamic" {
  url = "https://open.spotify.com/track/3H3cOQ6LBLSvmcaV7QkZEu?si=c5acff51b56a44b2"
}

resource "spotify_playlist" "playlist" {
  name        = "My Terraform Playlist"
  description = "Creé esta playlist con terraform"
  public      = true

  tracks = flatten([
    data.spotify_track.aerodynamic.id
  ])
}
