cask "iconchanger" do
  version "1.3.3"
  sha256 :no_check

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v#{version}/IconChanger.dmg"
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
