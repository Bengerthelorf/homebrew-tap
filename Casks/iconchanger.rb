cask "iconchanger" do
  version "1.4.4-8"
  sha256 "36f2ea4f998f6a20fa7cd7dba8a43e59332f7b3ad52e2581f66ad87ce4d4b99e"
  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.4-8/IconChanger.dmg"
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
