module.exports = {
  // TODO: remove this when we no longer process releases on GitLab CI
  repositoryUrl: 'https://github.com/saltstack-formulas/dotfiles-formula',
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
