cask "ridgeline" do
  version "0.3.0"

  on_arm do
    sha256 "6b0130a797c434eb08873f96380e0887038edd7b014412bf706051b11359ae79"
    url "https://github.com/Saturate/ridgeline/releases/download/v#{version}/Ridgeline_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 :no_check
    url "https://github.com/Saturate/ridgeline/releases/download/v#{version}/Ridgeline_#{version}_x64.dmg"
  end

  name "Ridgeline"
  desc "Cross-tenant pull request monitor for Azure DevOps"
  homepage "https://github.com/Saturate/ridgeline"

  app "Ridgeline.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Ridgeline.app"]
  end

  zap trash: [
    "~/Library/Application Support/ridgeline",
  ]
end
