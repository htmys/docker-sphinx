FROM ubuntu:16.04
MAINTAINER Hiroaki Tomiyoshi

ARG http_proxy
ARG https_proxy
ENV http_proxy ${http_proxy}
ENV https_proxy ${https_proxy}


RUN apt-get update \
        && apt-get upgrade -y


RUN apt-get install -y \
        build-essential \
        python \
        python-pip


RUN pip install --upgrade \
        pip \
        Sphinx


# Diagrams support
# blockdiag - Tools for generate block-diagram      <http://blockdiag.com/ja/blockdiag>
# seqdiag   - Tools for generate sequence-diagram   <http://blockdiag.com/ja/seqdiag>
# actdiag   - Tools for generate activity-diagram   <http://blockdiag.com/ja/actdiag>
# nwdiag    - Tools for generate network-diagram    <http://blockdiag.com/ja/nwdiag>
RUN pip install --upgrade \
        sphinxcontrib-blockdiag \
        sphinxcontrib-seqdiag \
        sphinxcontrib-actdiag \
        sphinxcontrib-nwdiag


# Export PDF
RUN apt-get install -y \
        texlive-base \
        texlive-lang-cjk \
        texlive-latex-extra


# Write Markdown(Common Mark)
RUN pip install recommonmark


# Auto build & Auto page reload
RUN pip install sphinx-autobuild
EXPOSE 8000


# Extension for Javadoc
RUN pip install javasphinx


WORKDIR /docs

# Build HTML
CMD make html

# Build PDF
# CMD make latexpdf
