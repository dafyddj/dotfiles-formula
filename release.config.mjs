const commitTypes = [
  { type: 'feat', section: 'Features' },
  { type: 'fix', section: 'Bug Fixes' },
  { type: 'test', section: 'Testing' },
  { type: 'ci', section: 'Continuous Integration' },
  { type: 'revert', section: 'Reversions' },
  { type: 'docs', section: 'Documentation' },
  { type: 'perf', section: 'Performance Improvements' },
  { type: 'refactor', section: 'Code Refactoring' },
  { type: 'style', section: 'Style Changes' },
  { type: 'chore', section: 'Maintenance' }
]

// Default rules can be found in `github.com/semantic-release/commit-analyzer/lib/default-release-rules.js`
// that cover feat, fix, perf and breaking
// Commits using the types below will be incorporated into the next release.
//
// NOTE: Any changes here must be reflected in `CONTRIBUTING.md`.
const releaseRules = [
  { type: 'docs', release: 'patch' },
  { type: 'refactor', release: 'patch' },
  { type: 'revert', release: 'patch' },
  { type: 'style', release: 'patch' },
  { type: 'test', release: 'patch' }
]

export default {
  plugins: [
    ['@semantic-release/commit-analyzer', {
      preset: 'angular',
      releaseRules
    }],
    '@semantic-release/release-notes-generator',
    ['@semantic-release/changelog', {
      changelogFile: 'CHANGELOG.md',
      changelogTitle: '# Changelog'
    }],
    ['@semantic-release/exec', {
      // eslint-disable-next-line no-template-curly-in-string
      prepareCmd: 'sh ./pre-commit_semantic-release.sh ${nextRelease.version}'
    }],
    ['@semantic-release/git', {
      assets: ['*.md', 'docs/*.rst', 'FORMULA']
    }],
    '@semantic-release/github'
  ],
  preset: 'angular',
  presetConfig: {
    types: commitTypes
  }
}
