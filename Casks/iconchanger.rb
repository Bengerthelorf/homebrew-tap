cask "iconchanger" do
  version "1.5.0"
  sha256 "d0e0e50bd57adb6551e7ed5d21ae74023019daa3acbf0c71a80332a2ecbd714a"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.5.0/IconChanger.dmg"
  name "IconChanger"
  desc "Customize macOS app and folder icons"
  homepage "https://github.com/Bengerthelorf/macIconChanger"

  depends_on macos: ">= :ventura"

  app "IconChanger.app"

  zap trash: [
    "~/Library/Preferences/com.zhuhaoyu.IconChanger.plist",
    "~/Library/Caches/com.zhuhaoyu.IconChanger",
    "~/Library/Application Support/com.zhuhaoyu.IconChanger",
    "~/.iconchanger",
  ]
end
