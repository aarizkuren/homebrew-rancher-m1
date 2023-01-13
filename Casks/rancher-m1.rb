cask "rancher-m1" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.7.0"
  sha256 arm:   "35717cec609e21f2e744ef66c8681af4fa1199251f243af93f791ca02dbb8557",
         intel: "828dde44868c3c33fe709e099f9af080143a379f9fba2e3bacd8641f5ad8e72b"

  url "https://github.com/rancher-sandbox/rancher-desktop/releases/download/v#{version}/Rancher.Desktop-#{version}-mac.#{arch}.zip",
      verified: "github.com/rancher-sandbox/rancher-desktop/"
  name "Rancher Desktop (M1 version)"
  desc "Kubernetes and container management on the desktop"
  homepage "https://rancherdesktop.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "docker"

  app "Rancher Desktop.app"

  uninstall delete: [
              "/opt/rancher-desktop",
              "/private/etc/sudoers.d/zzzzz-rancher-desktop-lima", # zzzzz is not a typo
              "/private/var/run/docker.sock",
              "/private/var/run/rancher-desktop-*",
            ],
            quit:   "io.rancherdesktop.app"

  zap trash: [
    "~/.kuberlr",
    "~/.rd",
    "~/Library/Application Support/Caches/rancher-desktop-updater",
    "~/Library/Application Support/Rancher Desktop",
    "~/Library/Application Support/rancher-desktop",
    "~/Library/Caches/io.rancherdesktop.app*",
    "~/Library/Caches/rancher-desktop",
    "~/Library/Logs/rancher-desktop",
    "~/Library/Preferences/ByHost/io.rancherdesktop.app*",
    "~/Library/Preferences/io.rancherdesktop.app.plist",
    "~/Library/Preferences/rancher-desktop",
    "~/Library/Saved Application State/io.rancherdesktop.app.savedState",
  ]
end
