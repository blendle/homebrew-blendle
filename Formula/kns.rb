class Kns < Formula
  desc "kns - kubernetes namespace switcher"
  homepage "https://gist.github.com/koenbollen/342c138b6a77d3de6869aad68c193617"
  url "https://gist.github.com/342c138b6a77d3de6869aad68c193617.git",
    :revision => "0e5b3848c15b8cbae79c92dcb8f1483edeea6953"
  head "https://gist.github.com/342c138b6a77d3de6869aad68c193617.git"

  depends_on "fzf"

  def install
    prefix.install 'kns.bash'
  end

  def post_install
    kns_path = (opt_prefix + 'kns.bash').to_s
    %w(~/.bash_profile ~/.zshrc).map{|f| Pathname(f).expand_path}.each do |file|
      next unless file.exist?
      next if file.readlines.grep(/#{kns_path}/).size > 0
      file.open('a') do |f|
        f << "\n[[ -f \"#{kns_path}\" ]] && source \"#{kns_path}\"\n"
      end
    end
  end

  def caveats; <<-EOS.undent
    Your ~/.bash_profile or ~/.zshrc had a source-line added to it to make
    kns available on the command line. It'll still be there after an uninstall.

    Reload you shell using:
      $ exec $SHELL

    Also, I recommend this alias:
      $ alias k=kubectl
    EOS
  end
end
