class Kubecrt < Formula
  desc "Convert Helm charts to Kubernetes resources"
  homepage "https://github.com/blendle/kubecrt"
  url "https://github.com/blendle/kubecrt.git",
    tag:      "v0.9.1",
    revision: "56be1141b406552ed043c29a87950cd519f7bbc6"
  head "https://github.com/blendle/kubecrt.git"

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    sha256 cellar: :any_skip_relocation
    sha256 "18f2f3a15a9b17c5e12076752e4050a8200db8b9692a1aa3928be5ebad87a4a4" => :high_sierra
  end

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    buildpath.join("src/github.com/blendle/kubecrt").install buildpath.children
    cd "src/github.com/blendle/kubecrt" do
      system "dep", "ensure", "-vendor-only"
      system "make", "build"
      bin.install "bin/kubecrt"
    end
  end

  test do
    system "#{bin}/kubecrt", "--version"
  end
end
