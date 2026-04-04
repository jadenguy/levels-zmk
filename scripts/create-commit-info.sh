#!/bin/bash

# Create commit info file for ZMK firmware builds
echo "ZMK Firmware Build Information" > commit_info.txt
echo "=============================" >> commit_info.txt
echo "Commit SHA: ${GITHUB_SHA}" >> commit_info.txt
echo "Short SHA: ${GITHUB_SHA:0:7}" >> commit_info.txt
echo "Branch: ${GITHUB_REF_NAME}" >> commit_info.txt
echo "Commit Message: $(git log -1 --pretty=format:'%s')" >> commit_info.txt
echo "Commit Author: $(git log -1 --pretty=format:'%an <%ae>')" >> commit_info.txt
echo "Commit Date: $(git log -1 --pretty=format:'%ci')" >> commit_info.txt
echo "Build Date: $(date -u)" >> commit_info.txt
echo "Repository: ${GITHUB_REPOSITORY}" >> commit_info.txt
echo "Workflow Run: ${GITHUB_RUN_NUMBER}" >> commit_info.txt

if [ "${GITHUB_EVENT_NAME}" = "pull_request" ]; then
  echo "PR Number: ${GITHUB_EVENT_NUMBER}" >> commit_info.txt
fi

echo "" >> commit_info.txt
echo "Boards built: levels54_left, levels54_right" >> commit_info.txt
echo "Studio enabled on: levels54_left" >> commit_info.txt
echo "" >> commit_info.txt
echo "This firmware was built from commit ${GITHUB_SHA}" >> commit_info.txt

echo "Created commit info:"
cat commit_info.txt