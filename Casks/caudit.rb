cask "caudit" do
  version "0.0.7"
  sha256 "8cd8e21407b777792f76f9255ecc99a62abb3f5447e54492e7a2bb2137cbb198"

  url "https://github.com/Bengerthelorf/Caudit/releases/download/v0.0.7/Caudit.dmg"
  name "Caudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Caudit"

  depends_on macos: ">= :ventura"

  app "Caudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Caudit.plist",
  ]
end
