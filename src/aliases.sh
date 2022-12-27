# Мое..
alias cd_p="cd ~/Projects"
alias cd_t="cd ~/ForTesting"
alias cd_s="cd ~/srv"
alias vim_srv="cd /srv/README.md"
alias v="vim"
alias n="nvim"
alias nn="nano
alias reload="source ~/.bashrc"

# Youtube
alias youtube_mp3='youtube-dl --extract-audio --audio-format mp3 '
alias youtube_channel='youtube-dl -f best -ciw -o "%(title)s.%(ext)s" -v '

# Git
unalias g
function g {
    local sURL
    local sUser
    local sRepo
    sURL="$1"
    sUser=$(echo $sURL | cut -d/ -f 4)
    sRepo=$(echo $sURL | cut -d/ -f 5)
    git clone --recurse-submodules $sURL $(echo "$sUser""_""$sRepo")
}

# g "https://github.com/dothq/browser"

# SSH
alias ssh_front_prod="ssh VM-FRONT"
alias ssh_front_dev="ssh VM-FRONT-DEV"
alias ssh_svc_dev="ssh VM-SVC-DEV"

# Disk space, folder size
alias df_current="df -h ."
alias du_dir="du -h -d 0"

alias open="xdg-open"

alias ae_debugger="cd /run/media/hightemp/dea1c06e-07a4-4e78-8a86-ff1150df2e3f/home/hightemp/WorkProjects/app_avto_express_debugger && quasar_dev_electron"


alias code_default="code --user-data-dir ~/code_profiles/default/data"
alias c="code --user-data-dir ~/code_profiles/default/data"
alias code_editor="code_default"


alias ls_laht_last="ls -laht | head"
alias lll="ls_laht_last"
alias ls_laht="ls -laht"
alias ll="ls_laht"

alias tar_cp="tar cf - . | tar xf - -C"

alias rsync_dir=".vscode/rsync.sh"
alias git_commit="capp_ae_cli git_commit; git push;"
alias git_checkout=".vscode/git_checkout.sh"

i3-gui(){
    # Create tabbed container.
    i3-msg split v > /dev/null
    i3-msg layout tabbed > /dev/null

    # Run program.
    nohup $@ &

    # Remove container.
    i3-msg move up > /dev/null
    i3-msg move down > /dev/null
}

# Aliases for programs with a gui.
alias i3r_konsole="i3-gui konsole"
alias i3r_feh="i3-gui feh"
alias i3r_gimp="i3-gui gimp"
alias i3r_mpv="i3-gui mpv"
alias i3r_libreoffice="i3-gui libreoffice"

alias i3r_save_session="i3"

alias cat_personal_data="cat /run/media/hightemp/dea1c06e-07a4-4e78-8a86-ff1150df2e3f/home/hightemp/Projects/wapp_main_links_list/docs/personal_data/index.md"

alias dc_ps="docker-compose ps"
alias dc_top="docker-compose top"
alias dc_up="docker-compose up --build -d"
alias dc_down="docker-compose down -v"
alias dc_logs="docker-compose logs"

alias n="nvim"
