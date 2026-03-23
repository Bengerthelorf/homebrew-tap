cask "claudit" do
  version "0.0.10"
  sha256 "7bd9005d0682869884658ecd0dab1827c0e15fe3ffd04f85a34c244c9421778d"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.10/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
