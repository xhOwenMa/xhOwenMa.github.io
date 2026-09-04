# xhOwenMa.github.io

Personal homepage, built with Jekyll and served by GitHub Pages.

- `index.html` — page content (about text lives here)
- `_data/publications.yml` — publication list, newest first
- `_data/service.yml` — reviewing / service entries
- `_config.yml` — name, affiliation, links
- `assets/css/site.css` — the only stylesheet
- `cv/` — LaTeX source for the CV; run `cv/build.sh` to regenerate `assets/files/curriculum_vitae.pdf`

Local preview: `bundle install && bundle exec jekyll serve --livereload`, then open http://localhost:4000.
