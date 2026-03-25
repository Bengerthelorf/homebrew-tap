cask "claudit" do
  version "0.0.26"
  sha256 "dba136718ed96545a7308556ba438a68db9597fd2396ceb4c62d7b0f32e526d5"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.26/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
