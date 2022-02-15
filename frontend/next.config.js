const { PHASE_DEVELOPMENT_SERVER } = require('next/constants')

module.exports = (phase, { defaultConfig }) => {
  if (phase === PHASE_DEVELOPMENT_SERVER) {
    process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
  }

  let config = {
    swcMinify: true,
    i18n: {
      locales: ["en", "fi"],
      defaultLocale: "en",
    },
    images: {
      domains: [process.env.NEXT_IMAGE_DOMAIN],
    },
    async rewrites() {
      return [
        {
          source: "/blog",
          destination: "/blog/page/0",
        },
        {
          source: "/es",
          destination: "/es/home",
          locale: false,
        },
        {
          source: "/en/principal",
          destination: "/",
          locale: false,
        },
      ]
    },
    poweredByHeader: false,
  };

  return {
    ...defaultConfig,
    ...config
  };
}
