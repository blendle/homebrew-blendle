class Epp < Formula
  desc "Small templating engine that allows the use of environmental variables."
  homepage "https://github.com/blendle/epp"
  url "https://github.com/blendle/epp.git",
    :tag => "v3.0.0",
    :revision => "e3a91c4a56070ee6da295f0390b85426af138351"
  head "https://github.com/blendle/epp.git"

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    cellar :any_skip_relocation
    sha256 "210939057c89dd70d71d802e563616e28088b2a5fc052db1239ab62ea5e723e2" => :catalina
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
