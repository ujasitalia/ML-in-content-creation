library(ari)
library(aws.polly)
library(tuneR)
library(webshot)
Sys.setenv("AWS_ACCESS_KEY_ID" = "AKIAUFSLL5UPSLQPTW4N",
           "AWS_SECRET_ACCESS_KEY" = "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",
           "AWS_DEFAULT_REGION" = "us-east-2")

Sys.setenv("ffmpeg" = "E:/ffmpeg/bin/ffmpeg.exe")


# narrate
# ari_narrate(script = 'C:/Users/Dell/Documents/BEProject/ari_intro_script.md',
#             slides = 'C:/Users/Dell/Documents/BEProject/intro.html',
#             voice = "Joey",
#             output = tempfile(fileext = '.mp4', tmpdir = getwd()))

# rmd_file <- ari_example("ari_intro_script.md")
# 
# # Normally you would create this HTML file using rmarkdown::render()
# html_file <- "C:/Users/Dell/Documents/BEProject/intro.html"
# ari_narrate(rmd_file, html_file, voice = "Joey", capture_method = "iterative")

ari_narrate(system.file("test", "ari_intro_script.md", package = "ari"),
            "http://seankross.com/ari/inst/test/ari_intro.html",
            
             voice = 'Joey', 
            capture_method = "iterative")

# spin
# slides <- c("C:/Users/Dell/Documents/BEProject/1.png","C:/Users/Dell/Documents/BEProject/2.png","C:/Users/Dell/Documents/BEProject/3.png","C:/Users/Dell/Documents/BEProject/4.png","C:/Users/Dell/Documents/BEProject/5.png")
# sentences <- readLines('sentence.md')
# ari_spin(slides, sentences, voice = "Joey", output=file(fileext = '.mp4', tmpdir = getwd()))

# stitch
# if (ffmpeg_version_sufficient()) {
#     result = ari_stitch(
#         c("C:/Users/Dell/Documents/BEProject/1.png","C:/Users/Dell/Documents/BEProject/2.png","C:/Users/Dell/Documents/BEProject/3.png","C:/Users/Dell/Documents/BEProject/4.png","C:/Users/Dell/Documents/BEProject/5.png"),
#         list(tuneR::noise(), tuneR::noise(),tuneR::noise(), tuneR::noise(),tuneR::noise()))
# }
