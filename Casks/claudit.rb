cask "claudit" do
  version "0.0.18"
  sha256 "933020aacfe6cf86c1f6f5516a1ef3998d27c4df326a34674f9c8f3aca7d2904"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.18/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
