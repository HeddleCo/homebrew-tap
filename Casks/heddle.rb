cask "heddle" do
  version "0.31.3"
  sha256 "848a1f854fe85c39abf3e4e853b8fb037120a39b380fc649ea5f70fe98ecbda9"

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
