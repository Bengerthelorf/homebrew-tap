cask "claudit" do
  version "0.0.24"
  sha256 "4b2403d43845a479f845c1d51d0ce6d70713035548b0ee5e21bacc5750990f97"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.24/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
