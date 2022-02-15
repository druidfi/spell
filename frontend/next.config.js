const { PHASE_DEVELOPMENT_SERVER } = require('next/constants')

module.exports = (phase, { defaultConfig }) => {
  if (phase === PHASE_DEVELOPMENT_SERVER) {
    process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
  }

  return {
    images: {
      domains: [process.env.NEXT_IMAGE_DOMAIN],
    },
  }
}
