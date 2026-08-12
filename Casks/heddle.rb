cask "heddle" do
  version "0.12.0"
  sha256 "8762a64e5b119c9a35d467a07843e0616a2456356ea8cea3e1f5a9a648a91c48"

  url "https://github.com/HeddleCo/heddle/releases/download/v#{version}/Heddle-v#{version}-macos-universal.dmg",
      verified: "github.com/HeddleCo/heddle/"
  name "Heddle"
  desc "AI-native version control system"
  homepage "https://heddle.sh/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Heddle.app"
  binary "#{appdir}/Heddle.app/Contents/Resources/bin/heddle", target: "heddle"

  postflight do
    lsregister = "/System/Library/Frameworks/CoreServices.framework/" \
                 "Frameworks/LaunchServices.framework/Support/lsregister"
    system_command lsregister, args: ["-f", "#{appdir}/Heddle.app"]
  end

  zap trash: [
    "~/Library/Application Support/Heddle",
    "~/Library/Preferences/sh.heddle.HeddleHost.plist",
  ]
end
