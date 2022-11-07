library(ari)
library(aws.polly)
library(tuneR)
library(webshot)
library(tools)
library(text2speech)
library(purrr)
library(xml2)
library(rvest)
library(progress)
library(hms)
library(testthat)
library(xaringan)
library(qs)
library(rmarkdown)
source('myFunction.R')

Sys.setenv("AWS_ACCESS_KEY_ID" = "AKIAUFSLL5UPSLQPTW4N",
           "AWS_SECRET_ACCESS_KEY" = "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",
           "AWS_DEFAULT_REGION" = "us-east-2")

Sys.setenv("ffmpeg" = "E:/ffmpeg/bin/ffmpeg.exe")



new_narrate(
                script = "C:/Users/Dell/Documents/BEProject/R/python-module-1.md",
                slides = "C:/Users/Dell/Documents/BEProject/R/python-module-1.html",
                voice = "Joanna", capture_method = "iterative",
                output = 'output.mp4'
            )
