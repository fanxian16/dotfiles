# alias
alias ls="eza -a"
alias ll="eza -lah"
alias tree="tree -a"
alias v="nvim"
alias vv="v ~/.zshrc"
alias ss="source ~/.zshrc"
alias pe="source ~/.venv/bin/activate"
alias py="python3"
alias de="deactivate"
alias buu="brew update && brew upgrade"
alias bbd="brew bundle dump --describe --file=~/dotfiles/Brewfile --force"
alias bbb="brew bundle --file=~/dotfiles/Brewfile"
# 插件
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# function

function x-install_swift_script() {
  local src="$1"
  local name="$(basename "$src" .swift)"
  local dest="$HOME/.local/bin/$name"

  mkdir -p "$HOME/.local/bin"

  echo "⚙️ 正在编译 $src → $dest"
  if swiftc "$src" -o "$dest"; then
    chmod +x "$dest"
    echo "✅ 编译完成，命令已安装为: $name"
    if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
      echo "⚠️ 警告：$HOME/.local/bin 不在 PATH 中，请添加到 ~/.zshrc："
      echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
    fi
  else
    echo "❌ 编译失败: $src"
  fi
}

# 路径
export PATH="$HOME/.local/bin:$PATH"
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# 美化
eval "$(starship init zsh)"
