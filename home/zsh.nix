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

    initExtra = ''
        fastfetch

        # Enable Powerlevel10k instant prompt
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
           source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi

      # source the theme
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme


      # to customize prompt, run `p10k configure` or edit ~/.p10k.zsh
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

       # highlight man using nvim
       vman() { nvim <(man $1); }

       warper() {
            sudo warp-svc
            warp-cli connect
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
      ls = "eza";
      "177013" = "xdg-open https://nhentai.to/g/177013";
      "344322" = "xdg-open https://nhentai.net/g/344322";
      rebuild = "sudo nixos-rebuild switch --flake ~/flake#hoshino --impure";
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
