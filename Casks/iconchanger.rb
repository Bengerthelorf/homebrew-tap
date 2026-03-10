cask "iconchanger" do
  version "1.4.1"
  sha256 "f512bcf731edf57d36bb756cb480b61ef463cb718c60d1e1046825d395e66701"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.1/IconChanger.dmg"
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
