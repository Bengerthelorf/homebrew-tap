cask "claudit" do
  version "0.0.21"
  sha256 "5245996f90805a25aaf2d836729d240be393c5254ff019e11bf453ae0eb7ad74"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.21/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
