cask "claudit" do
  version "0.0.11"
  sha256 "c5478a0a1e684a40b769e38da134ed1f860b293da512f51952d5d44f034e678a"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.11/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
