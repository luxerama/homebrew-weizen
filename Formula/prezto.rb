require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Prezto < Formula
  homepage 'https://github.com/sorin-ionescu/prezto'
  url 'https://github.com/sorin-ionescu/oh-my-zsh.git'


  def install
    system "git clone --recursive #{url} ~/.oh-my-zsh"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test oh`.
    system "false"
  end
end
