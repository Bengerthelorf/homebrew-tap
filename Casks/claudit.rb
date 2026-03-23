cask "claudit" do
  version "0.0.14"
  sha256 "7ca38ca3f301fa533e99e0b1824e0011f41d01d0c358a77ba97b41fca2474ec5"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.14/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
