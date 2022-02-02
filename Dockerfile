FROM pandoc/latex:2.17.1

RUN tlmgr install \
    adjustbox \
    background \
    collectbox \
    everypage \
    float \
    footmisc \
    footnotebackref \
    koma-script \
    ly1 \
    mdframed \
    needspace \
    pagecolor \
    sourcecodepro \
    sourcesanspro \
    titling \
    zref
