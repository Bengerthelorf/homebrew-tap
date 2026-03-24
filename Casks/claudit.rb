cask "claudit" do
  version "0.0.16"
  sha256 "d16489cb679a026704c16954198541d1c5a5e50ccb1ff68e6515ed39748b0832"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.16/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
