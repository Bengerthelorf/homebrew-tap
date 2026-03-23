cask "caudit" do
  version "0.0.8"
  sha256 "3a9c69349e449888b07b956965fe7a117d0da940224bc8e144d26922aab078b2"

  url "https://github.com/Bengerthelorf/Caudit/releases/download/v0.0.8/Caudit.dmg"
  name "Caudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Caudit"

  depends_on macos: ">= :ventura"

  app "Caudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Caudit.plist",
  ]
end
