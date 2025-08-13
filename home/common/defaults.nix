{ config, ... }:
let
  homeDir = config.home.homeDirectory;
in
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = homeDir;

    documents = "${homeDir}/papers";
    templates = "${homeDir}/papers/templates";

    download = "${homeDir}/downloads";

    music = "${homeDir}/media/music";
    pictures = "${homeDir}/media/photos";
    videos = "${homeDir}/media/videos";

    publicShare = null;

    extraConfig = {
      XDG_SCREENSHOTS_DIR = "${homeDir}/media/screenshots";
      XDG_MEMES_DIR = "${homeDir}/media/memes";
      XDG_CLIPS_DIR = "${homeDir}/media/clips";

      XDG_CODE_DIR = "${homeDir}/code";
      XDG_CODE_CLI_DIR = "${homeDir}/code/cli";
      XDG_CODE_WEB_DIR = "${homeDir}/code/web";
      XDG_CODE_DATA_DIR = "${homeDir}/code/data";
      XDG_CODE_GRAPHICS_DIR = "${homeDir}/code/graphics";
      XDG_CODE_APPS_DIR = "${homeDir}/code/apps";
      XDG_CODE_EMBEDDED_DIR = "${homeDir}/code/embedded";
      XDG_CODE_MINECRAFT_DIR = "${homeDir}/code/minecraft";
      XDG_CODE_SCRIPTS_DIR = "${homeDir}/code/scripts";
      XDG_CODE_SCHOOL_DIR = "${homeDir}/code/school";
      XDG_CODE_MISC_DIR = "${homeDir}/code/misc";

      XDG_PAPERS_CREATIVE_DIR = "${homeDir}/papers/creative";
      XDG_PAPERS_CREATIVE_POETRY_DIR = "${homeDir}/papers/creative/poetry";
      XDG_PAPERS_CREATIVE_PROSE_DIR = "${homeDir}/papers/creative/prose";
      XDG_PAPERS_ENTERTAINMENT_DIR = "${homeDir}/papers/entertainment";
      XDG_PAPERS_REFERENCE_DIR = "${homeDir}/papers/reference";
      XDG_PAPERS_SCHOOL_DIR = "${homeDir}/papers/school";
    };
  };

  services.syncthing = {
    enable = true;
    overrideFolders = true;
    # guiAddress is 127.0.0.1:8384.

    settings = {
      folders = {
        "${homeDir}/code" = { };
        "${homeDir}/media" = { };
        "${homeDir}/papers" = { };
      };
    };
  };
}
