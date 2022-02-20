#!/usr/bin/env sh

# остановить публикацию при ошибках
set -e

pnpm run build

cd dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:AVor0n/vue-covid-tracker.git master:gh-pages

cd -