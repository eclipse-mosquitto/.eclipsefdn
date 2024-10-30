local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-mosquitto') {
  settings+: {
    description: "",
    name: "Eclipse Mosquitto",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  secrets+: [
    orgs.newOrgSecret('CODECOV_TOKEN') {
      value: "pass:bots/iot.mosquitto/codecov.io/codecov-token",
    },
  ],
  _repositories+:: [
    orgs.newRepo('mosquitto') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Mosquitto - An open source MQTT broker",
      has_wiki: false,
      homepage: "https://mosquitto.org",
      topics+: [
        "broker",
        "eclipse-iot",
        "libwebsockets",
        "mosquitto",
        "mqtt"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('COVERITY_SCAN_EMAIL') {
          value: "********",
        },
        orgs.newRepoSecret('COVERITY_SCAN_TOKEN') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('mosquitto.rsmb') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "python"
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Mosquitto rsmb",
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
  ],
}
