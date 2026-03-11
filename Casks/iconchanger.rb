cask "iconchanger" do
  version "1.4.2"
  sha256 "566bfdcaf8ed17ef11cd762d4a5f5d7fbc9e870a40c7b2cb2604179571d5e4b9"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.2/IconChanger.dmg"
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
