{ pkgs, username, ... }:
{
  programs.zen-browser = {
    enable = true;

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xp";
          installation_mode = "force_installed";
        };
        "{74186d10-f6f2-4f73-b33a-83bb72e50654}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/transparent-zen/latest.xp";
          installation_mode = "force_installed";
        };
      };
    };
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "zen.theme.content-element-separation" = 0;
          "zen.view.experimental-rounded-view" = false;
          "browser.download.dir" = "/home/${username}/downloads";
        };
        search = {
          force = true;
          default = "DuckDuckGo";
          order = [
            "DuckDuckGo"
            "Google"
          ];
          engines = {
            "DuckDuckGo".metaData.alias = "@dd";
            "Google".metaData.alias = "@g";
            "Bing".metaData.hidden = true;
          };
        };
      };
    };
  };

  # Zen mods configuration.
  home.file.".zen/default/zen-themes.json".text = builtins.toJSON {
    "642854b5-88b4-4c40-b256-e035532109df" = {
      author = "sameerasw";
      createdAt = "2025-02-04";
      description = "Make the Zen Browser's tab background transparent, get smooth animations and more. Enable  features in mod settings and visit the homepage below to learn more about the features. 👇";
      enabled = true;
      homepage = "https://github.com/sameerasw/zen-themes/tree/main/TransparentZen";
      id = "642854b5-88b4-4c40-b256-e035532109df";
      image = "https://raw.githubusercontent.com/zen-browser/theme-store/main/themes/642854b5-88b4-4c40-b256-e035532109df/image.png";
      name = "Transparent Zen";
      preferences = "https://raw.githubusercontent.com/zen-browser/theme-store/main/themes/642854b5-88b4-4c40-b256-e035532109df/preferences.json";
      readme = "https://raw.githubusercontent.com/zen-browser/theme-store/main/themes/642854b5-88b4-4c40-b256-e035532109df/readme.md";
      style = "https://raw.githubusercontent.com/zen-browser/theme-store/main/themes/642854b5-88b4-4c40-b256-e035532109df/chrome.css";
      tags = [ ];
      updatedAt = "2025-06-22";
      version = "1.13.0";
    };
    "c6813222-6571-4ba6-8faf-58f3343324f6" = {
      author = "gunir";
      createdAt = "2024-08-19";
      description = "Disable Rounded Corners from Web View.";
      enabled = true;
      homepage = "https://github.com/gunir/desktop/tree/themes/themes";
      id = "c6813222-6571-4ba6-8faf-58f3343324f6";
      image = "https://raw.githubusercontent.com/zen-browser/theme-store/main/themes/c6813222-6571-4ba6-8faf-58f3343324f6/image.png";
      name = "Disable Rounded Corners";
      readme = "https://raw.githubusercontent.com/zen-browser/theme-store/main/themes/c6813222-6571-4ba6-8faf-58f3343324f6/readme.md";
      style = "https://raw.githubusercontent.com/zen-browser/theme-store/main/themes/c6813222-6571-4ba6-8faf-58f3343324f6/chrome.css";
      tags = [ ];
      updatedAt = "2025-01-26";
      version = "3.0.0";
    };
  };
}
