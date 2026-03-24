cask "claudit" do
  version "0.0.20"
  sha256 "535098f09d6b548a5776429a4436b8ea985121c3a39bb1618094f95c1179bf13"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.20/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
