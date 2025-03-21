{...}: {
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
    AddKeysToAgent yes
    Host github.com
      User git
      IdentityFile /home/kira/kirakey
    '' ;
  };
}
