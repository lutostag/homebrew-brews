class Justprep < Formula
  desc "Pre-processor for the just command-line utility"
  homepage "https://github.com/MadBomber/justprep"
  url "https://github.com/MadBomber/justprep/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "7b482e617d562afb277565f2fc5f331ea0a1d72e548730a19e9117f58852e5df"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/lutostag/brews"
    sha256 cellar: :any,                 big_sur:      "8ef018027efb5953912f7bed6f891f8532cff6e8ad796c6f1a9f9b8dce8468d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e5df967a5e0ae6d94bee857acc8d069864b0b9e39a6bdbf654d7d4f0a4617ce8"
  end

  depends_on "crystal" => :build
  depends_on "just" => :build

  depends_on "bdw-gc"
  depends_on "libevent"
  depends_on "pcre"

  def install
    system "just", "static=true", "crystal/build"
    bin.install "./crystal/bin/justprep"
  end

  test do
    system "#{bin}/justprep", "--version"
  end
end
