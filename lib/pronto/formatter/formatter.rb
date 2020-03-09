module Pronto
  module Formatter
    def self.get(names)
      names ||= 'text'
      Array(names).map { |name| FORMATTERS[name.to_s] || TextFormatter }
        .uniq.map(&:new)
    end

    def self.names
      FORMATTERS.keys
    end

    FORMATTERS = {
      'github' => GithubFormatter,
      'github_status' => GithubStatusFormatter,
      'github_pr' => GithubPullRequestFormatter,
      'github_pr_review' => GithubPullRequestReviewFormatter,
      'gitlab' => GitlabFormatter,
      'bitbucket' => BitbucketFormatter,
      'bitbucket_pr' => BitbucketPullRequestFormatter,
      'bitbucket_server_pr' => BitbucketServerPullRequestFormatter,
      'json' => JsonFormatter,
      'checkstyle' => CheckstyleFormatter,
      'text' => TextFormatter,
      'null' => NullFormatter
    }.freeze

    RUNNER_TITLE = "PRONTO_%{runner_title}_TITLE".freeze
  end
end
