cask "iconchanger" do
  version "1.4.4-4"
  sha256 "9c137c99cfeff9b5a43a045a1b661c542d7a08f887fa93c02650b33f4b23656d"

  url "https://github.com/Bengerthelorf/macIconChanger/releases/download/v1.4.4-4/IconChanger.dmg"
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
