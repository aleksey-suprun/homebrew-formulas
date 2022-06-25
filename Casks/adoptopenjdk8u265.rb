cask "adoptopenjdk8u265" do
  version "8,265:b01"
  sha256 "db8b19f943bf96774a805b646b2c0ddd532123391e2e3873fe3720558e6091fe"

  url "https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-binaries/releases/download/jdk8u265-b01/OpenJDK8U-jdk_x64_mac_hotspot_8u265b01.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name "AdoptOpenJDK 8"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK8U-jdk_x64_mac_hotspot_8u265b01.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.8.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.8.jdk"
end
