cask "iconchanger" do
  version "1.4.4"
  sha256 "d41cbe328d5f8c09081b4515bf1d7b06714f26c624bfcdcb937344c7258f881b"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.4/IconChanger.dmg"
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
