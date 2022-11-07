# library(ari)
# library(aws.polly)
# library(tuneR)
# library(webshot)
# library(tools)
# library(text2speech)
# library(purrr)
# library(xml2)
# library(rvest)
# library(progress)
# library(hms)
# library(testthat)
# library(xaringan)
# library(qs)
# library(rmarkdown)
source('spin.R')

new_narrate <- function(script, slides, output = "output.mp4", voice,
                        capture_method = "vectorized", ...){
    if(length(aws.polly::list_voices()) < 1){
        stop("It appears you're not connected to Amazon Polly. Make sure you've", 
             "set the appropriate environmental variables before you proceed.")
    }
    
    if(!(capture_method %in% c("vectorized", "iterative"))) {
        stop('capture_method must be either "vectorized" or "iterative"')
    }
    
    output_dir <- normalizePath(dirname(output))
    script <- normalizePath(script)
    if(file.exists(slides)){
        print(slides)
        #slides <- normalizePath(slides)
        #print(slides)
        ## webshot, if webshot webshot:::is_windows(),
        ## call webshot:::fix_windows_url() which append his version of
        ## "file:///"..., hence if this part run on window it brake the procedure.
        #
        if (.Platform$OS.type == "windows"){
            
            ## slash was missing
            #
            slides <- paste0("file://localhost/", slides)
            print(slides)
        }
    }
    stopifnot(
        file.exists(script),
        dir.exists(output_dir)
    )
    
    if(file_ext(script) %in% c("Rmd", "rmd")){
        paragraphs <- parse_html_comments(script)
    } else {
        html_path <- file.path(output_dir, paste0("ari_script_",randomStrings(N=1, string_size=5), ".html"))
        on.exit(unlink(html_path, force = TRUE), add = TRUE)
        render(script, output_format = html_document(), output_file = html_path)
        paragraphs <- map_chr(html_text(html_nodes(read_html(html_path), "p")), 
                              function(x){gsub("\u2019", "'", x)})
    }
    
    slide_nums <- 1:length(paragraphs)
    img_paths <- file.path(output_dir, paste0("ari_img_", slide_nums, "_",randomStrings(N=1, string_size=5), ".jpeg"))
    
    if(capture_method == "vectorized"){
        webshot(url = paste0(slides, "#", slide_nums), file = img_paths, ...)
    } else {
        for(i in slide_nums){
            webshot(url = paste0(slides, "#", i), file = img_paths[i], ...)
        }
    }
    
    on.exit(walk(img_paths, unlink, force = TRUE), add = TRUE)
    new_spin(img_paths, paragraphs, output, voice)
    invisible()
}
