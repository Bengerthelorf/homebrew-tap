cask "claudit" do
  version "0.0.15"
  sha256 "f0d68a5c9516802c0e1f1d67ce0334cabf135c88ca07655d63134e61b5cc4793"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.15/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
