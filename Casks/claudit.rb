cask "claudit" do
  version "0.0.13"
  sha256 "f7f0e37374c8e38081338164cbe09364b4615cfa720b3c0855f3d8e74e776bf0"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.13/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
