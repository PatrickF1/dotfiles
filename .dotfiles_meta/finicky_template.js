// Finicky config — https://github.com/johnste/finicky/wiki/Configuration-(v4)
// Machine-local file, NOT tracked in dotfiles (seeded from
// .dotfiles_meta/finicky_template.js by install_shell_utilities.fish).
// Add routing rules for this machine here, e.g. sending work SSO/auth
// domains to a work browser profile so OAuth links land in the profile
// that can actually complete the login.
export default {
  defaultBrowser: "Google Chrome",
  handlers: [
    // Example: route work domains to a specific Chrome profile. `profile` is
    // the profile's display name, as shown in chrome://settings/manageProfile.
    // {
    //   match: ["*.example.okta.com*", "example.com*", "*.example.com*"],
    //   browser: { name: "Google Chrome", profile: "Work" },
    // },
  ],
};
