# geoenv24

Presentation for the 15th International Conference on Geostatistics for Environmental Applications.

Template using xaringan adapted from [fernandomayer](https://github.com/fernandomayer/y-isa).

## To view this presentation

[nagahamavh.github.io/geoenv24](https://nagahamavh.github.io/geoenv24)


## To reproduce this presentation

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
> rmarkdown::render("river_nngp.Rmd", output_file = "index")
```

and see the slides in `index.html` in your browser.
