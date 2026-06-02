cask "ridgeline" do
  version "0.7.0"

  on_arm do
    sha256 "7600506dcd2a4f6d3512b62594d012708d724ea8c6950f9e6f93f726c3185225"
    url "https://github.com/Saturate/ridgeline/releases/download/v#{version}/Ridgeline_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "6d5e733598fd2aa2da7fd4da3e93140340ef62b2f6e25fff540425e9a4cc354d"
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
