module.exports = {
  plugins: [
    ['@semantic-release/commit-analyzer', {
      preset: 'conventionalcommits',
      releaseRules: './release-rules.js'
    }],
    '@semantic-release/release-notes-generator',
    '@semantic-release/github'
  ],
  generateNotes: {
    preset: 'conventionalcommits'
  }
}
