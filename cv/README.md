## CV source

LaTeX source for the CV linked from the website. `owen_ma_cv.tex` is the single
source of truth — the PDF served at `assets/files/curriculum_vitae.pdf`
(referenced by `cv_link` in `_config.yml`) is generated from it.

### Build

```sh
./build.sh
```

This compiles `owen_ma_cv.tex` and copies the result over
`assets/files/curriculum_vitae.pdf`. It uses a local `pdflatex` if one is
installed and otherwise falls back to the Docker image defined in `Dockerfile`.

Commit the regenerated `assets/files/curriculum_vitae.pdf` along with your
`.tex` changes — the build is not automated in CI.

### License

Based on the [sb2nov/resume](https://github.com/sb2nov/resume) template.
Format is MIT; the CV content is owned by Xinhang (Owen) Ma.
