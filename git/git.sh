#!/bin/sh

git-squash() {
    if [ $# -ne 1 -o "$1" = "-h" ]
    then
        echo -e "Usage: git-squash -h | number_of_commits"
        return 1
    fi

    if ! [[ ($1 =~ ^[0-9]+$) && ($1 -gt 1) ]]
    then
        echo "Number of squashes must be an integer greater than 1"
        return 1
    fi

    git log -n $1 || return $?

    echo
    read -p "Squash these commits? [N/y] "
    echo

    if ! [[ $REPLY =~ ^[Yy] ]]
    then
        echo "Squash aborted"
        return 2
    fi

    echo Squashing $1 commits
    git reset --soft HEAD~$1 &&
        git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"
}

git-spring-clean() {
    local current_branch=$(git rev-parse --abbrev-ref HEAD)
    for branch in $(git branch --merged | egrep -v "(^\*|master|dev)" | cut -c3-)
        do
            echo -e "Branch \033[0;32m$branch\033[0m is already merged into $current_branch."
            echo "Would you like to delete it? [Y]es/[N]o "
            read REPLY
            if [[ $REPLY =~ ^[Yy] ]]; then
                git branch -d $branch
            fi
    done
}
