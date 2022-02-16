const { PHASE_DEVELOPMENT_SERVER } = require('next/constants')

module.exports = (phase, { defaultConfig }) => {
  if (phase === PHASE_DEVELOPMENT_SERVER) {
    process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
  }

  let config = {
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
          source: "/fi",
          destination: "/fi/home",
          locale: false,
        },
      ]
    },
    poweredByHeader: false,
    swcMinify: true,
  };

  return {
    ...defaultConfig,
    ...config
  };
}
