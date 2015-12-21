deis-buildpack-group
--------------------

This repository provides the Deis team a single location to manage a release of
various Deis PaaS components. Currently the repository is only intended to be
used for release coordination.

### Common Actions

#### Checking Out Last Tested Version of Repos

Note: this just checks out the version
of each repository that was last committed by a
human until further work can bring testing into
this repository

    make checkout

#### Checking Out Latest Master of Repos

    make update

#### Committing All Changes in Repos

    make commit

#### Pushing Committed Changes in Repos

    make push

#### Tagging All Repos

    TAG=<tag number> TAG_MESSAGE=<message> make tag

#### Deleting A Tag in All Repos

    TAG=<tag number> make tag-delete

#### Pushing All Tags

    make tag-push

#### Bumping Versions

    VERSION=<next version> IMAGE_PREFIX=<deisci|deis> make next-version
