cask "caudit" do
  version "0.0.1"
  sha256 "994aa4759a7b25fc8201b4d37cd6b49ef6e05594f0aeee5b609943bae18bfadb"

  url "https://github.com/Bengerthelorf/Caudit/releases/download/v0.0.1/Caudit.dmg"
  name "Caudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Caudit"

  depends_on macos: ">= :ventura"

  app "Caudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Caudit.plist",
  ]
end
