cask "ridgeline" do
  version "0.5.0"

  on_arm do
    sha256 :no_check
    url "https://github.com/Saturate/ridgeline/releases/download/v#{version}/Ridgeline_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "2de06816df803a5c9e24a54f2314778a0c0c6ba9ebf1705f345ca7d9dd8e8b3e"
    url "https://github.com/Saturate/ridgeline/releases/download/v#{version}/Ridgeline_#{version}_x64.dmg"
  end

  name "Ridgeline"
  desc "Cross-tenant pull request monitor for Azure DevOps"
  homepage "https://github.com/Saturate/ridgeline"

  app "Ridgeline.app"
  binary "#{appdir}/Ridgeline.app/Contents/MacOS/ridgeline"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Ridgeline.app"]
  end

  zap trash: [
    "~/Library/Application Support/ridgeline",
  ]
end
