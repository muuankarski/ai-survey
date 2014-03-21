#!/bin/bash


# Create and move to backup directory
cd ~/workspace/russia/ai-survey
curl -o form.md http://pad.okfn.org/p/AiSurvey/export/txt

pandoc -s -S --toc --number-section -H rmarkdown_survey.css form.md -o form.html
pandoc --toc form.md -o form.docx
pandoc --toc form.md -o form.odt
#pandoc --toc --number-section --latex-engine=xelatex -V lang=english -V papersize:a4paper -V documentclass=scrartcl form.md -o form.pdf
pandoc -s -S -H /home/aurelius/workspace/web/css/rmarkdown.css index.md -o index.html

git commit -am "questionnaire updated"
git push
