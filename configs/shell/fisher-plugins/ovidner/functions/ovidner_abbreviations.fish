function ovidner_abbreviations
  echo -n "\
    da=django-admin
    dasp=django-admin shell_plus

    g=git
    gca=git commit --amend
    gco=git checkout
    gfp=git push --force-with-lease
    grb=git rebase
    grba=git rebase --abort
    grbc=git rebase --continue
    grbi=git rebase -i HEAD~8
    grbm=git fetch; git rebase origin/master
    gs=git stash
    gsp=git stash pop

    psh=pipenv shell
  " | grep '^.*=.*' | sed -E 's/^[[:space:]]*(.+)=(.+)$/\1 \2/'
end
