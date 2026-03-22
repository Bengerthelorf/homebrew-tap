cask "caudit" do
  version "0.0.6"
  sha256 "dd8537e38da20af16fecbf8b2cb640978ff5a788cbecc444eed9269f64daeefa"

  url "https://github.com/Bengerthelorf/Caudit/releases/download/v0.0.6/Caudit.dmg"
  name "Caudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Caudit"

  depends_on macos: ">= :ventura"

  app "Caudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Caudit.plist",
  ]
end
