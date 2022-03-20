class Justprep < Formula
  desc "Pre-processor for the just command-line utility"
  homepage "https://github.com/MadBomber/justprep"
  url "https://github.com/MadBomber/justprep/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "7b482e617d562afb277565f2fc5f331ea0a1d72e548730a19e9117f58852e5df"
  license "MIT"

  depends_on "crystal" => :build
  depends_on "just" => :build

  def install
    system "just", "static=true", "crystal/build"
    bin.install "./crystal/bin/justprep"
  end

  test do
    system "#{bin}/justprep", "--version"
  end
end
