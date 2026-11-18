cask "claudit" do
  version "0.0.26"
  sha256 "dba136718ed96545a7308556ba438a68db9597fd2396ceb4c62d7b0f32e526d5"

  url "https://github.com/Bengerthelorf/Claudit/releases/download/v#{version}/Claudit.dmg"
  name "Claudit"
  desc "Claude API usage tracker for the menu bar"
  homepage "https://github.com/Bengerthelorf/Claudit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Claudit.app"

  zap trash: "~/Library/Preferences/homes.snaix.Claudit.plist"
end
