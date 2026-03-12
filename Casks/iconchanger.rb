cask "iconchanger" do
  version "1.4.3"
  sha256 "184f6804503ad8a5ea9dd312aa22b14dd603c467501d7fb4127bbd81bf489fb2"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.3/IconChanger.dmg"
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
