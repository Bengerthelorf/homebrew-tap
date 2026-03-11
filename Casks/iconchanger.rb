cask "iconchanger" do
  version "1.4.2-2"
  sha256 "dc10128bc1f76a624144f80bf4a99f483f19655a5fbd5b793d7a7142d91d1bd0"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.2-2/IconChanger.dmg"
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
