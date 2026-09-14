# Homebrew tap for Libratory

[Libratory](https://github.com/subev/libratory) turns PDFs and EPUBs into audiobooks you can read
along with, on your own machine.

```sh
brew install --cask subev/libratory/libratory
```

Apple Silicon, macOS 13 or later. The full name is deliberate: since Homebrew 7 it is what lets a
cask from a third-party tap load without a separate `brew trust subev/libratory`, which you only
need for the short `brew install --cask libratory`. The app keeps your library in Postgres through Docker, so have
[OrbStack](https://orbstack.dev/) or Docker Desktop running before the first launch.

The app updates itself from GitHub Releases, so `brew upgrade` leaves it alone unless you pass
`--greedy`. Either route lands on the same build.

`brew uninstall --zap --cask libratory` removes the app, its Python runtime and the data folder
with your finished audiobooks. The Docker volume holding the library and the downloaded models
stay; [docs/uninstall.md](https://github.com/subev/libratory/blob/main/docs/uninstall.md) lists
them with their sizes.

The cask is written by the main repository's release script from each release's checksum; changes
to it belong in [`scripts/cask.mjs`](https://github.com/subev/libratory/blob/main/scripts/cask.mjs)
there.
