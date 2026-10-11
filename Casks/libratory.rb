cask "libratory" do
  version "26.1011.1"
  sha256 "8285d3cb3fa15800f4546de5f91e3bf3ce765feaa12f6815cf83f7150bc4759d"

  url "https://github.com/subev/libratory/releases/download/v#{version}/Libratory-arm64.zip"
  name "Libratory"
  desc "Turns PDFs and EPUBs into audiobooks you can read along with"
  homepage "https://libratory.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Libratory.app"

  zap trash: [
    "~/Library/Application Support/Libratory",
    "~/Library/Caches/@libratorydesktop-updater",
    "~/Library/Caches/dev.libratory.app",
    "~/Library/Caches/dev.libratory.app.ShipIt",
    "~/Library/HTTPStorages/dev.libratory.app",
    "~/Library/Preferences/dev.libratory.app.plist",
    "~/Library/Saved Application State/dev.libratory.app.savedState",
  ]

  caveats do
    <<~EOS
      Libratory keeps your library in Postgres, run through Docker. Install Docker Desktop
      or OrbStack and have it running before the first launch:

        brew install --cask orbstack        # lighter, Mac only
        brew install --cask docker-desktop  # or the original

      `brew uninstall --zap` removes the app, its Python runtime and the data folder holding
      your finished audiobooks, but not the Docker volume with the library or the downloaded
      models. https://github.com/subev/libratory/blob/main/docs/uninstall.md lists those.
    EOS
  end
end
