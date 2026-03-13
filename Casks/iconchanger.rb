cask "iconchanger" do
  version "1.4.4-3"
  sha256 "040e3b03cd05a20d47cd4570fb7f98e2c360120729b27a14f618c8a01316937d"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.4-3/IconChanger.dmg"
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
