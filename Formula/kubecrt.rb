class Kubecrt < Formula
  desc "Convert Helm charts to Kubernetes resources."
  homepage "https://github.com/blendle/kubecrt"
  url "https://github.com/blendle/kubecrt.git",
    :tag => "v0.8.0",
    :revision => "9408029c819fcf411111aff06ae3c210ca469fe6"
  head "https://github.com/blendle/kubecrt.git"

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    cellar :any_skip_relocation
    sha256 "db22dd5c3b84130cb45aa614a13beef59e8cc0f659937d40cf1a2f35b970b062" => :high_sierra
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
