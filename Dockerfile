FROM python:3.10

LABEL "com.github.actions.name"="YAPF Python Code Formatting Check"
LABEL "com.github.actions.description"="Run YAPF to check that your python code if correctly formatted."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="106a4e"
LABEL "repository"="https://github.com/AlexanderMelde/yapf-action"
LABEL "homepage"="https://github.com/AlexanderMelde/yapf-action"
LABEL "maintainer"="Alexander Melde <alexander@melde.net>"

RUN pip install --upgrade pip
RUN pip install "git+https://github.com/char101/yapf.git@3.10#egg=yapf"

COPY entrypoint.sh /entrypoint.sh
COPY Grammar3.10.0.final.0.pickle /usr/local/lib/python3.10/site-packages/yapf/ylib2to3/Grammar3.10.1.final.0.pickle
COPY PatternGrammar3.10.0.final.0.pickle /usr/local/lib/python3.10/site-packages/yapf/ylib2to3/PatternGrammar3.10.1.final.0.pickle
COPY Grammer.txt /usr/local/lib/python3.10/site-packages/yapf/ylib2to3/Grammer.txt
COPY PatternGrammar.txt /usr/local/lib/python3.10/site-packages/yapf/ylib2to3/PatternGrammar.txt

ENTRYPOINT ["/entrypoint.sh"]
