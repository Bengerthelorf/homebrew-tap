cask "iconchanger" do
  version "1.4.0"
  sha256 "8e9995a68685a28251f1940571b6039df59277082726bbb062004e6a371c7508"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.0/IconChanger.dmg"
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
