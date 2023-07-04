web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
release: chmod u+x heroku_release_script.sh && ./heroku_release_script.sh
