FROM pandoc/latex:2.14

RUN tlmgr install \
    adjustbox \
    background \
    collectbox \
    everypage \
    footmisc \
    footnotebackref \
    ly1 \
    mdframed \
    needspace \
    pagecolor \
    sourcecodepro \
    sourcesanspro \
    titling \
    zref
