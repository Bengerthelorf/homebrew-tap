cask "claudit" do
  version "0.0.17"
  sha256 "fe4815149cd866faee40262b27d57d53a50a135a7d32f1834fc0cff2d4d4f787"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.17/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
