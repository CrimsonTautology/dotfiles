# merge project-a into project-b as subdirectory path/to/project-b/sub-a/
https://stackoverflow.com/questions/1425892/how-do-you-merge-two-git-repositories

```
cd path/to/project-a
git filter-repo --to-subdirectory-filter sub-a

cd path/to/project-b
git remote add project-a /path/to/project-a
git fetch project-a --tags
git merge --allow-unrelated-histories project-a/master # or whichever branch you want to merge
git remote remove project-a
```