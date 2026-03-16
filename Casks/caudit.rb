cask "caudit" do
  version "0.0.4"
  sha256 "40358f76da7a82dde1a7720bf7537e59d1f4aaa111fc10586d0223c1f79dc727"

  url "https://github.com/Bengerthelorf/Caudit/releases/download/v0.0.4/Caudit.dmg"
  name "Caudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Caudit"

  depends_on macos: ">= :ventura"

  app "Caudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Caudit.plist",
  ]
end
