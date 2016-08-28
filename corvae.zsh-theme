# corvae.zsh-theme

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

local ruby_env=''
if which rvm-prompt &> /dev/null; then
  ruby_env=' ‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    ruby_env=' ‹$(rbenv version-name)›%{$reset_color%}'
  fi
fi

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'
local return_code="%(?,%{$fg[green]%}%?%{$reset_color%},%{$fg[red]%}%?)%{$reset_color%}"


PROMPT="╭─%{$FG[040]%} %n(ncsa)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} [%{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}]${git_info} %{$FG[239]%}%{$reset_color%}
-
╰─ ${return_code}%{$reset_color%} ] "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%} ✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔"
