cask "claudit" do
  version "0.0.23"
  sha256 "58912d9c0aecd0d748c2121ab166383c25ac8932eb734f1060d8f435619fbcaf"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.23/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
