cask "claudit" do
  version "0.0.25"
  sha256 "37d94fabbcad158a81a3193e85da214f455d2731bb776188de238ad22b079fc7"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.25/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
