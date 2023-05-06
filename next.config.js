/** @type {import('next').NextConfig} */
module.exports = {
  reactStrictMode: true,
  images: {
    domains: [
      'cdn.tft.tools',
      'cdn.metatft.com',
      'liguify.s3.us-west-004.backblazeb2.com',
      'f004.backblazeb2.com',
    ],
  },
}
