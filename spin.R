new_spin <- function(images, paragraphs, output = "output.mp4", voice){
    if(length(list_voices()) < 1){
        stop("It appears you're not connected to Amazon Polly. Make sure you've ", 
             "set the appropriate environmental variables before you proceed.")
    }
    stopifnot(length(images) > 0)
    images <- normalizePath(images)
    output_dir <- normalizePath(dirname(output))
    stopifnot(
        length(paragraphs) > 0,
        identical(length(images), length(paragraphs)),
        all(file.exists(images)),
        dir.exists(output_dir)
    )
    
    wavs <- list()
    par_along <- 1:length(paragraphs)
    ideal_duration <- rep(NA, length(paragraphs))
    
    pb <- progress_bar$new(format = "Fetching Narration [:bar] :percent", total = length(par_along))
    
    for(i in par_along){
        if(nchar(paragraphs[i]) < 1500){
            wav <- synthesize(paragraphs[i], voice)
        } else {
            chunks <- split_up_text(paragraphs[i])
            wav <- reduce(map(chunks, synthesize, voice = voice), bind)
        }
        ideal_duration[i] <- ceiling(length(wav@left) / wav@samp.rate)
        end_wav <- Wave(rep(0, wav@samp.rate * ideal_duration[i] - length(wav@left)),
                        bit = wav@bit, samp.rate = wav@samp.rate)
        wavs[[i]] <- bind(wav, end_wav)
        pb$tick()
    }
    
    ari_stitch(images, wavs, output)
}
