{
  programs.git = {
    enable = true;

    userName = "Celso Miranda";
    userEmail = "769237+celsomiranda@users.noreply.github.com";

    extraConfig = {
      alias = {
        changes = "diff --stat";
      };

      init.defaultBranch = "main";

      core = {
        pager = "less --raw-control-chars --quit-if-one-screen --no-init";
        symlinks = true;
      };

      color.ui = true;

      "gitflow \"prefix\"" = {
        feature = "feature/";
        release = "release/";
        hotfix = "hotfix/";
        support = "support/";
      };

      pull.ff = "only";

      push.default = "simple";

      feature.manyFiles = true;

      fetch.prune = true;

      tag.forceSignAnnotated = true;
    };

    ignores = [
      # Allway Sync
      "_SYNCAPP"

      # Mac files
      ".DS_Store"
      "[Dd]esktop.ini"
      "._*"
      "[Tt]humbs.db"

      # Windows files
      "[Dd]esktop.ini"
      "Thumbs.db"
      "Thumbs.db:encryptable"
      "ehthumbs.db"
      "ehthumbs_vista.db"

      # Files on external disks
      ".Spotlight-V100"
      ".Trashes"

      # Microsoft office
      "*.tmp"
      "~$*.doc*"
      "~$*.xls*"
      "*.xlk"
      "~$*.ppt*"
      "*.~vsd*"
    ];
  };
}
