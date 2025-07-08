{
  pkgs,
  config,
  ...
}: {
  home.file.".p10k.zsh".source = ../dots/.p10k.zsh;

  home.file.".config/fastfetch/config.jsonc".source = ../dots/fastfetch.jsonc;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      share = true;
      extended = true;
    };

    initContent = ''
            fastfetch

      # Enable Powerlevel10k instant prompt
            if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
              source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
                fi

      # source the theme
                source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      # add ssh key from ~/.key gor github
                if [ -z "$SSH_AUTH_SOCK" ]; then
                  eval "$(ssh-agent -s)"
                    ssh-add ~/key # or id_rsa if you use RSA keys
                    fi

      # to customize prompt, run `p10k configure` or edit ~/.p10k.zsh
                    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      # highlight man using nvim
                    vman() { nvim <(man $1); }

          wifer() {
            systemctl suspend
              ~/bits-login/login.sh
              sudo warp-svc
              warp-cli connect
          }

          cleaner() {
            sudo nix profile wipe-history  --profile /nix/var/nix/profiles/system
              sudo nix-collect-garbage --delete-old
              nix-collect-garbage --delete-old
              nix store gc
              sudo nix store optimise
          }

          rebuild() {
            sudo mount /dev/nvme0n1p4 /boot
              sudo nixos-rebuild switch --flake ~/flake#kage --impure
          }

          ff() {
            local file
              file=$(fzf --query="$1") || return
              cd "$(dirname "$file")" || return
          }

          fvim() {
            local file
              file=$(fzf --query="$1") || return
              nvim "$file" || return
          }

          waller() {
            cd
              mkdir .flakewal
              wal -i ~/flake/assets/wallpapers/bakane.jpg
              rsync -a ~/.cache/wal/ ~/.flakewal
              wal -i "$1"
          }

          compdef _waller waller

            _waller() {
              _files
            }


    '';

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    shellAliases = {
      saymyname = "echo Heisenberg";
      warper = "sudo true && sudo warp-svc & (sleep 3 && warp-cli connect) & wait";
      ama = "adb start-server &&";
      vim = "nvim";
      timer = "sudo -E timeshift-gtk";
      img = "kitten icat";
      ls = "eza";
      kewie = "cd ~/Music && kew \$(fzf)";
      fd = "cd ~ && cd \$(find . -type d | fzf)";
      celld = "cd ~ && celluloid \$(find . -type d |fzf)/*";
      dvim = "cd ~ && cd \$(find * -type d | fzf) && nvim .";
      "177013" = "xdg-open https://nhentai.to/g/177013";
      "344322" = "xdg-open https://nhentai.net/g/344322";
      wifilogin = "~/bits-login/login.sh";
      # Basic git commands
      g = "git";
      gs = "git status";
      ga = "git add";
      gaa = "git add --all";
      gc = "git commit -v";
      gcmsg = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gd = "git diff";
      gco = "git checkout";
      gb = "git branch";
      gl = "git log";

      # More advanced aliases
      glog = "git log --oneline --decorate --graph";
      grb = "git rebase";
      grs = "git reset";
      grh = "git reset --hard";
      gcl = "git clone";
      gf = "git fetch";
      gm = "git merge";
    };
  };
}
