cask "iconchanger" do
  version "1.4.4-7"
  sha256 "5c23f0b00c44fb3fe3f6e026c0a23408de0f78c0aabccac4333c751924e3adfa"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.4-7/IconChanger.dmg"
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
