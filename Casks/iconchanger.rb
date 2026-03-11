cask "iconchanger" do
  version "1.4.2-1"
  sha256 "f741c0b9f07c7f15a8c7b8099a5ab9af0fa336126aa7d4e922f40b371ed3060e"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.2-1/IconChanger.dmg"
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
