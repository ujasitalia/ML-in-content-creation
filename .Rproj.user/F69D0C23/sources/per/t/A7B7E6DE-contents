library(ari)
library(aws.polly)
library(tuneR)
library(webshot)
Sys.setenv("AWS_ACCESS_KEY_ID" = "AKIAUFSLL5UPSLQPTW4N",
           "AWS_SECRET_ACCESS_KEY" = "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",
           "AWS_DEFAULT_REGION" = "us-east-2")

Sys.setenv("ffmpeg" = "E:/ffmpeg/bin/ffmpeg.exe")

ari_narrate(script = system.file("test", "ari_intro_script.md", package = "ari"),
            slides = system.file("test", "ari_intro.html", package = "ari"),
            voice = "Joey")

#para <- c("hello ujas!", "how are you doing?")

slides <- c("C:/Users/Dell/Documents/BEProject/1.png","C:/Users/Dell/Documents/BEProject/2.png","C:/Users/Dell/Documents/BEProject/3.png","C:/Users/Dell/Documents/BEProject/4.png","C:/Users/Dell/Documents/BEProject/5.png")
sentences <- readLines('sentence.md')
#sentences <- readLines(system.file("test", "ari_intro_script.md", package = "ari"))
ari_spin(slides, sentences, voice = "Joey")


url <- 'file:///C:/Users/Dell/Documents/R/win-library/4.0/ari/test/ari_intro.html#3'
webshot(url = url)
print(system.file("test", "ari_intro.html", package = "ari"))
slides = system.file("test", "ari_intro.html", package = "ari")
print(normalizePath(slides))



#######
if (file.exists(slides)) {
    slides <- normalizePath(slides)
    if (.Platform$OS.type == "windows") {
        slides <- paste0("file://localhost/", slides)
    } else {
        slides <- paste0("file://localhost", slides)
    }
}