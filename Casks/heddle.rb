cask "heddle" do
  version "0.28.10"
  sha256 "e0869c26132665b7d69643b0167a93aa1968fc5fb425ddac4b952518981ad6ee"

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
