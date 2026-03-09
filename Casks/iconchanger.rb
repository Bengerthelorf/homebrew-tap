cask "iconchanger" do
  version "1.3.5"
  sha256 "449a79b9a9591d626badf30a77121f0c8930e781262ad06d799f84b9c105da41"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.3.5/IconChanger.dmg"
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
