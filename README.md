# geoenv24

Presentation for the 15th International Conference on Geostatistics for Environmental Applications

## To reproduce this slides

1. Install `renv`

```r
> install.packages("renv")
```

2. Clone this repository with git (this is in a Linux/Unix terminal)

```bash
$ git clone https://github.com/nagahamaVH/geoenv24.git
```

Or download a zip file from
[here](https://github.com/nagahamaVH/geoenv24/archive/refs/heads/master.zip).

3. Open R in this project and run

```r
> renv::restore()
```

to install all the packages needed.

4. Run

```r
> rmarkdown::render("river_nngp.Rmd")
```

and see the slides in `river_nngp.html` in your browser.
