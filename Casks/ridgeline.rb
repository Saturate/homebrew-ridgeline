cask "ridgeline" do
  version "0.8.0"

  on_arm do
    sha256 "1a3d710b8bc248759df2192f8af70752c3f58de40bf30174c942ada8f2175924"
    url "https://github.com/Saturate/ridgeline/releases/download/v#{version}/Ridgeline_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "edb8b0657dbb30354f9187e271a7e52604a0b89294e77894a45ae434cbe0d000"
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
