cask "iconchanger" do
  version "1.4.4-6"
  sha256 "0b5efd2dd31ad356fec55d8f0e6926d261fcfd6fb9073d4ad98ddd843d2022fd"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.4-6/IconChanger.dmg"
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
