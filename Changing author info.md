# Changing author info

To change the name and/or email address recorded in existing commits, you must rewrite the entire history of your Git repository.

## Changing the Git history of your repository using a script

Before running this script, you'll need:

- The old email address that appears in the author/committer fields that you want to change
- The correct name and email address that you would like such commits to be attributed to

1. Open the terminal.

2. Create a fresh, bare clone of your repository:

    ```bat
    git clone --bare https://github.com/user/repo.git
    cd repo.git
    ```

3. Copy and paste the script, replacing the following variables based on the information you gathered:

   - `OLD_EMAIL`
   - `CORRECT_NAME`
   - `CORRECT_EMAIL`

    ```sh
    #!/bin/sh

    git filter-branch --env-filter '

    OLD_EMAIL="your-old-email@example.com"
    CORRECT_NAME="Your Correct Name"
    CORRECT_EMAIL="your-correct-email@example.com"

    if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_COMMITTER_NAME="$CORRECT_NAME"
        export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
    fi
    if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_AUTHOR_NAME="$CORRECT_NAME"
        export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    fi
    ' --tag-name-filter cat -- --branches --tags
    ```

4. Press Enter to run the script.

5. Review the new Git history for errors.

6. Push the corrected history to GitHub:

    ```bat
    git push --force --tags origin 'refs/heads/*'
    ```

7. Clean up the temporary clone:

    ```bat
    cd ..
    rm -rf repo.git
    ```