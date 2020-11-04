#!/bin/bash
CURRENT_PROFILE=""
GLOBAL_PROFILE=""

function add_profile() {
    echo ""
}

function _git_profile_is_repo_profile() {
    GLOBAL_PROFILE=$(_git_profile_get_global_profile)
    REPO_PROFILE=$(_git_profile_get_repo_profile)

    if [ ! -z "$REPO_PROFILE" ]; then
        echo 1
    else
        echo 0
    fi
}

function _git_profile_get_current_profile() {
    GLOBAL_PROFILE=$(_git_profile_get_global_profile)
    REPO_PROFILE=$(_git_profile_get_repo_profile)

    if [ ! -z "$REPO_PROFILE" ]; then
        echo $REPO_PROFILE
    else
        echo $GLOBAL_PROFILE
    fi
}

function git_profile_set_repo_profile() {
    name=$1
    git config profile.name $name

    _git_profile_activate_profile
}

function _git_profile_get_repo_profile() {
    git config --get profile.name
}

function git_profile_set_global_profile() {
    name=$1
    git config --global profile.name $name

    _git_profile_activate_profile
}

function _git_profile_get_global_profile() {
    git config --global --get profile.name
}

function _git_profile_activate_profile() {
    name=$(_git_profile_get_current_profile)

    user=$(yq r ~/.gitprofiles.yaml 'profiles(name=='$name')'.user)
    email=$(yq r ~/.gitprofiles.yaml 'profiles(name=='$name')'.email)
    sshCommand=$(yq r ~/.gitprofiles.yaml 'profiles(name=='$name')'.sshCommand)

    if [ $(_git_profile_is_repo_profile) -eq 1 ]; then
        git config user.name $user
        git config user.email $email
        git config core.sshCommand $sshCommand
    else 
        git config --global user.name $user
        git config --global user.email $email
        git config --global core.sshCommand $sshCommand
    fi
}

function git_profile() {
   CURRENT_PROFILE=$(_git_profile_get_current_profile)

   echo $CURRENT_PROFILE
}

