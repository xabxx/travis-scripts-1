#!/bin/bash
set -e
touch version.json
echo testtest1 >> version.json

# Upload version.json to CodeCommit
if [ -z "${MASTER_COMMIT_ID}" ]; then
    # version.json file being uploaded the first time
    aws codecommit put-file --repository-name "${CC_REPO_NAME}" --branch-name master --file-content file://"$pwd/version.json" --file-path version.json --file-mode normal
else
    aws codecommit put-file --repository-name "${CC_REPO_NAME}" --branch-name master --file-content file://"$pwd/version.json" --file-path version.json --file-mode normal
fi


