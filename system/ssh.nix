{...}: {
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
    AddKeysToAgent yes
    Host github.com
      User git
      IdentityFile /home/zenzawa/zenkey
    '' ;
  };
}
