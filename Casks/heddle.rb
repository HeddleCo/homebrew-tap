cask "heddle" do
  version "0.3.0"
  sha256 "5e5527b5942827211ec6bf48ddf73d661087f0d337fde349a009d9dc52c8c307"

  url "https://github.com/HeddleCo/heddle/releases/download/v#{version}/Heddle-v#{version}-macos-universal.dmg"
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
