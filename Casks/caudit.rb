cask "caudit" do
  version "0.0.5"
  sha256 "e3b885182ae4a096ab9b3861cf4f3abb0e6445d94cab358abe0fb5b7415e29b3"

  url "https://github.com/Bengerthelorf/Caudit/releases/download/v0.0.5/Caudit.dmg"
  name "Caudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Caudit"

  depends_on macos: ">= :ventura"

  app "Caudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Caudit.plist",
  ]
end
