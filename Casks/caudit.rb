cask "caudit" do
  version "0.0.2"
  sha256 "5b2c5cd892927098e5289c6e1f5320772dc0e8e2f88e55a71a3e37c96ace5627"

  url "https://github.com/Bengerthelorf/Caudit/releases/download/v0.0.2/Caudit.dmg"
  name "Caudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Caudit"

  depends_on macos: ">= :ventura"

  app "Caudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Caudit.plist",
  ]
end
