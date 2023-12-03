{ config, ... }: {
  services."caddy" = {
    enable = true;

    email = "acme@tuhana.me";

    virtualHosts = {
      "git.tuhana.me" = {
        extraConfig = ''
          reverse_proxy localhost:3000
        '';
      };

      # "vault.tuhana.me" = {
      #   extraConfig = ''
      #     reverse_proxy localhost:${toString config.services.vaultwarden.config.ROCKET_PORT}
      #   '';
      # };
    };
  };
}