cask "caudit" do
  version "0.0.3"
  sha256 "5ee747f3579e1813794c91f93ee7bc90ad7d8b6effd60b26d83fc2c85904c6b7"

  url "https://github.com/Bengerthelorf/Caudit/releases/download/v0.0.3/Caudit.dmg"
  name "Caudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Caudit"

  depends_on macos: ">= :ventura"

  app "Caudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Caudit.plist",
  ]
end
