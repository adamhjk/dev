pkg_name=dev
pkg_origin=adam
pkg_version="0.1.0"
pkg_maintainer="Adam Jacob <adam@chef.io>"
pkg_license=('Apache-2.0')
pkg_source="NOPE"
pkg_shasum="TODO"
pkg_deps=(
    core/python
    core/perl
    core/coreutils
    core/grep
    core/gawk
    core/git
    core/sed
    adam/zsh
)
pkg_build_deps=(
  core/git
  core/sed
)
pkg_bin_dirs=(bin)
pkg_description="Adam's development kit"

do_download() {
  return 0
}

do_verify() {
  return 0
}

do_unpack() {
  return 0
}

do_build() {
  return 0
}

do_check() {
  return 0
}

do_install() {
  ZSH_PREFIX="$(pkg_path_for zsh)"

  mkdir -p "$pkg_prefix/bin"
  cp "$PLAN_CONTEXT/start" "$pkg_prefix/bin"
  sed -i "s|PKG_PREFIX|$pkg_prefix|" "$pkg_prefix/bin/start"
  sed -i "s|ZSH_PREFIX|$ZSH_PREFIX|" "$pkg_prefix/bin/start"
  chmod 755 "$pkg_prefix/bin/start"
  cp "$PLAN_CONTEXT/zshrc" "$pkg_prefix/bin/.zshrc"
  sed -i "s|PKG_PREFIX|$pkg_prefix|" "$pkg_prefix/bin/.zshrc"
  git clone https://github.com/zplug/zplug "$pkg_prefix/zplug"
  export ZPLUG_HOME=$pkg_prefix/zplug
  $(pkg_path_for zsh)/bin/zsh --interactive $pkg_prefix/bin/.zshrc

  fix_interpreter $pkg_prefix/zplug/bin/zplug-env core/coreutils bin/env
  fix_interpreter $pkg_prefix/bin/start adam/zsh bin/zsh
}

do_strip() {
  return 0
}

