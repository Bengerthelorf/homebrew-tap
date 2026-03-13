cask "iconchanger" do
  version "1.4.4-1"
  sha256 "cd767ca5cce9f2d02ef4828d7e25f3f47f305716381e7c479c22f796c998f099"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.4-1/IconChanger.dmg"
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
