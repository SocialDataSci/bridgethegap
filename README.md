# What is this?

The Twin Cities Meetup group [Social Data Science](http://www.meetup.com/socialdatascience/) held an event, [Data4Good](http://www.meetup.com/socialdatascience/events/226079387/) on 11/14/2015. This repo contains a few scripts which enable folks like yourself to view, modify, and contribute to the dataset used at that meetup.

# How can I contribute?

Thank you very much for offering to help! This project enables users to enhance a specific dataset described above. Contributions can be made to the data itself or to the project tools that support the work with the data.

## Enhance the data

There are many ways to contribute:

- Use your analytical skills to help gain an understanding of the achievement gap
- Clean and enhance the data 

### Download the data

1. [Install MySQL](http://dev.mysql.com/doc/refman/5.7/en/installing.html) and either have Windows + Cygwin, Mac OS X, or Linux.
2. Clone this repo: `git clone https://github.com/SocialDataSci/bridgethegap.git`
3. Download the latest data: `./scripts/load-database.sh -u root -p -v latest`

If everyone went OK, after connecting to MySQL, you will have the following databases:

- bridgethegap - combined school level files
- data4good - school level yearly raw files
- district - TODO describe
- staff - TODO describe
- state - TODO describe

### Clean or enhance the data

1. See above on how to download the data. 
2. Modify the data with SQL and track each SQL statement
3. Once complete, add the SQL to the appropiate file in the updates directory
4. Run the tests: `./scripts/run-tests.sh -u root -p` in order to see if you need to update a golden file in the golden directory.
5. Commit the change to your fork and open a pull request

If you don't have expirence with git or GitHub, see [Github Hello World for more details](https://guides.github.com/activities/hello-world/).

## Flag a Data Issue

1. [Follow the instructions here to create an issue](https://help.github.com/articles/creating-an-issue/)
2. If you wish to work on the issue yourself, leave a comment stating so. Otherwise someone else may duplicate your effort.

## Enhance the tools

The tools are scripts and infrastructure to help users share and enhance the data. These enhancments are 
similar to contributing to any other Github project. See [Github Hello World for more details](https://guides.github.com/activities/hello-world/).

# Directories in this project

- cache   -- ignored by git, simple cache of internet based dependencies
- golden -- contains the golden files used to verify updates were applied correctly
- scripts -- scripts used to load the data and run tests
- updates -- sql scripts which can be modifed to update the database
