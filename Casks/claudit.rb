cask "claudit" do
  version "0.0.22"
  sha256 "c51009c3f2d57c8a8ed63e07e872d358b374debeb7fc77ddc3128283d8c14ff1"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.22/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
