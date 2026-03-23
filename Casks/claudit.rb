cask "claudit" do
  version "0.0.12"
  sha256 "05d12b8451b485dc4779fee79af24f45a8fd058691be3ea53b8e055085d32dc7"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v0.0.12/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for macOS menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  depends_on macos: ">= :ventura"

  app "Claudit.app"

  zap trash: [
    "~/Library/Preferences/homes.snaix.Claudit.plist",
  ]
end
