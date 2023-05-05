from urllib.request import urlretrieve
import praw, subprocess, re
from RedDownloader.RedDownloader import Download

ffmpeg = "/usr/bin/ffmpeg"

# Setup PRAW
reddit = praw.Reddit(
    client_id='kmrfaFUpqy_ybnvqqO9dnQ',
    client_secret='afsgIAiig84FXUxU83fsXUxD6lQ6Jw',
    user_agent='MemeScraper'
)

subreddit = input("Set a reddit: ")

valid = [".jpg",".png", ".gif"]
test = reddit.subreddit(subreddit).top(limit=201)
for i in range(0, 200):
    submission = next(x for x in test if not x.stickied)
    name = re.sub(".*/", "", submission.url) 
    fileType = name[-4:]
    if fileType in valid:
        try:
            urlretrieve(submission.url, f"dump/{name}")
        except:
            print("404: not found")
    else:
        try:
            url = submission.media["reddit_video"]["fallback_url"]
            url = url[:url.index("?")]
            files = []
            for run in range(2):
                if run == 0:
                    name = name + ".mp4" 
                if run == 1:
                    name = name + ".audio"
                    video = url[:url.index("_")] + "_audio"
                    url = video + url[url.index(".mp4"):]

                files.append(name)
                urlretrieve(url, f"dump/tmp/{name}")
            if len(files) > 1:
                subprocess.run([ffmpeg, "-i", f"dump/tmp/{files[0]}", "-i", f"dump/tmp/{files[1]}", "-c:v", "copy", "-c:a", "copy",f"dump/{files[0]}"])
            else:
                subprocess.run(["mv", f"dump/tmp/{files[0]}",f"dump/{files[0]}"])

            for file in files:
                subprocess.run(["rm", "-rf", f"dump/tmp/{file}"])
        except:
            print("Cannot do that")

