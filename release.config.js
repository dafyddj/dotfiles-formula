module.exports = {
  plugins: [
    ['@semantic-release/commit-analyzer', {
      preset: 'angular',
      releaseRules: './release-rules.js'
    }],
    '@semantic-release/release-notes-generator',
    '@semantic-release/github'
  ],
  generateNotes: {
    preset: 'angular'
  }
}
