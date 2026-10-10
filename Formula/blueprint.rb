class Blueprint < Formula
  desc "Draw a blueprint version of an app icon for debug builds"
  homepage "https://github.com/MustafaNatur/blueprint"
  url "https://github.com/MustafaNatur/blueprint/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "1ccd1b851037edfb8e62db0ef0d1067a5363a69a861ec17c915e4571cfcf37a3"
  license "MIT"

  depends_on xcode: ["26.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/blueprint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blueprint --version")
  end
end
