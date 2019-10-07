class Epp < Formula
  desc "Small templating engine that allows the use of environmental variables."
  homepage "https://github.com/blendle/epp"
  url "https://github.com/blendle/epp.git",
      :tag => "v2.2.0",
      :revision => "9a543b2ee47994dcd6e0d1021eace0c458acf4f2"
  head "https://github.com/blendle/epp.git"

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    cellar :any_skip_relocation
    sha256 "3f1f2cd20a6ede9410103c63c77c7b061d20a90ea87b58137f3d845a228c61d8" => :mojave
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
