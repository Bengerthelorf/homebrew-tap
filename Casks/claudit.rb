cask "claudit" do
  version "0.0.9"
  sha256 "a37b01af0f00f265098e2777535fccb6fc66ee319a20d1726c873d3d83b5c787"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.9/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
