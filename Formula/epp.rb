class Epp < Formula
  desc "Small templating engine that allows the use of environmental variables"
  homepage "https://github.com/blendle/epp"
  url "https://github.com/blendle/epp.git",
    tag:      "v3.1.0",
    revision: "b0be2422de871864e9ca3e3d28d5e9edf7b6d399"
  head "https://github.com/blendle/epp.git"

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    cellar :any_skip_relocation
    sha256 "22e59e961b6ad98ad72bd4e6594b488d0dde5debe40793cae8c94c49ccd6a80b" => :big_sur
  end

  depends_on "go" => :build

  def install
    system "make", "build"
    bin.install "bin/epp"
  end

  test do
    system "#{bin}/epp", "-version"
  end
end
