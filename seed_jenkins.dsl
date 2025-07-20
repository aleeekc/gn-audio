/*
 *  jenkins_dsl
 */

multibranchPipelineJob("stm32_job_demo") {
  displayName("STM32 Demo job")
  description("STM32 Demo job")

  branchSources {
    branchSource {
      source {
        github {
          repoOwner("aleeekc")
          repository("gn-audio")
          configuredByUrl(true)
          credentialsId("Github_token")
          id("jenkins_dsl")
          repositoryUrl("https://github.com/aleeekc/gn-audio")
          traits {
            gitHubBranchDiscovery {
              strategyId(1)
            }
            cleanBeforeCheckoutTrait()
          }
        }
      }
    }
  }

  configure {
    def traits = it / 'sources' / 'data' / 'jenkins.branch.BranchSource' / 'source' / 'traits'
    traits << 'org.jenkinsci.plugins.github__branch__source.OriginPullRequestDiscoveryTrait' {
      strategyId(1)
      trust(class: 'org.jenkinsci.plugins.github_branch_source.OriginPullRequestDiscoveryTrait$TrustPermission')
    }
  }

  factory {
    workflowBranchProjectFactory {
      scriptPath("Jenkinsfile")
    }
  }

  orphanedItemStrategy {
    defaultOrphanedItemStrategy {
      pruneDeadBranches(true)
      daysToKeepStr("")
      numToKeepStr("")
    }
  }

  triggers {
    periodic(1) // 1 minute
  }
}