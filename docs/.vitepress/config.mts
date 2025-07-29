import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "MWM Datallog",
  description: "The Micro Application Platform",
  vite: {
    server: {
      allowedHosts: ["datallog.geovanems.com.br"],
    },
  },
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "Home", link: "/" },
    ],

    sidebar: [
      {
        text: "Getting Started",
        items: [
          { text: "Quick Start", link: "/quick-start" },
          { text: "Core Concepts", link: "/core-concepts" },
          {
            text: "Commands",
            link: "/commands",
            items: [
              { text: "Init", link: "/commands/init" },
              { text: "Create App", link: "/commands/create-app" },
              { text: "Run", link: "/commands/run" },
              { text: "Login", link: "/commands/login" },
              { text: "Push", link: "/commands/push" },
              { text: "Install", link: "/commands/install" },
            ],
          },
        ],
      },
    ],

    socialLinks: [
      { icon: "github", link: "https://github.com/vuejs/vitepress" },
    ],
  },
});
