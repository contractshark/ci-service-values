add()
{
  if [ -z "$1" ];
  then
    return
  fi

  echo -n "-e $1 "
}
add "CODECOV_ENV"
add "CODECOV_TOKEN"
add "CODECOV_URL"
add "CODECOV_SLUG"
add "VCS_COMMIT_ID"
add "VCS_BRANCH_NAME"
add "VCS_PULL_REQUEST"
add "VCS_SLUG"
add "VCS_TAG"
add "CI_BUILD_URL"
add "CI_BUILD_ID"
add "CI_JOB_ID"

if [ "$SHARKCI_URL" != "" ];

if [ "$CI" = "true" ] && [ "$CI_NAME" = "codeship" ];
then
  add "CI"
  add "CI_NAME"
  add "CI_BRANCH"
  add "CI_BUILD_NUMBER"
  add "CI_BUILD_URL"
  add "CI_COMMIT_ID"
  
if [ "$CI" = "true" ] && [ "$TRAVIS" = "true" ] && [ "$SHIPPABLE" != "true" ];
then
  add "CI"
  add "TRAVIS"
  add "SHIPPABLE"
  add "TRAVIS_BRANCH"
  add "TRAVIS_COMMIT"
  add "TRAVIS_JOB_NUMBER"
  add "TRAVIS_PULL_REQUEST"
  add "TRAVIS_JOB_ID"
  add "TRAVIS_REPO_SLUG"
  add "TRAVIS_TAG"
  add "TRAVIS_OS_NAME"
fi
