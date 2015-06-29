# InviteScript

Script to invite to a mediawiki with [inviteSignup](https://www.mediawiki.org/wiki/Extension:InviteSignup) module installed to a list of emails.

it accepts an email as parameter and invite it to the wiki. If you have a list of emails in a text file, each of them in a separate line you can call the following command:

``` cat emails.txt | xargs -L1 ./inviteScript.sh ```

