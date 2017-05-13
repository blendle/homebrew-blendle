class Kubecrt < Formula
  desc "Convert Helm charts to Kubernetes resources."
  homepage "https://github.com/blendle/kubecrt"
  url "https://github.com/blendle/kubecrt.git",
    :tag => "v0.5.1",
    :revision => "a591b237b3621446ac0b383ecb62cddd42315e4c"
  head "https://github.com/blendle/kubecrt.git"

  depends_on "go" => :build
  depends_on "glide" => :build

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    cellar :any_skip_relocation
    sha256 "9e1da44221d6ce25d8f0c2e88cb633fd1e1da99e75034f631d7e82ea1ea2a337" => :sierra
  end

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
    dir = buildpath/"src/github.com/blendle/kubecrt"
    dir.install Dir["*"]
    cd dir do
      system "script/bootstrap"
      system "go", "build", "-o", bin/"kubecrt",
      "-ldflags",
      "-X github.com/blendle/kubecrt/config.version=#{version} -X github.com/blendle/kubecrt/config.gitrev=a591b23"
    end
  end

  test do
    system "#{bin}/kubecrt", "--version"
  end
end
