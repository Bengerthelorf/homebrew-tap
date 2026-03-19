cask "iconchanger" do
  version "1.4.4-5"
  sha256 "eafc9ab2d071c2472e068d4758696737242d06e16929837729d08ad8d6216965"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.4-5/IconChanger.dmg"
  name "IconChanger"
  desc "Customize macOS app icons"
  homepage "https://github.com/Bengerthelorf/macIconChanger"

  depends_on macos: ">= :ventura"

  app "IconChanger.app"

  zap trash: [
    "~/Library/Preferences/com.zhuhaoyu.IconChanger.plist",
    "~/.iconchanger",
  ]
end
