cask "claudit" do
  version "0.0.19"
  sha256 "c1e766f71baffbc9c7f6bd8f23659ab03c62b0abac509136b0cbab58980a3eeb"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.19/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
