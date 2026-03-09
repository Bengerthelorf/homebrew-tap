cask "iconchanger" do
  version "1.3.4"
  sha256 "ab256b444c4b104c95cf4e4eb48ec58e67a0543bdc4e00205eeb5c51b10ffabc"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.3.4/IconChanger.dmg"
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
