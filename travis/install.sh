MINICONDA_URL="http://repo.continuum.io/miniconda"
MINICONDA_FILE="Miniconda2-latest-Linux-x86_64.sh"
wget "$MINICONDA_URL/$MINICONDA_FILE"
bash $MINICONDA_FILE -b

export PATH=$HOME/miniconda/bin:$HOME/miniconda2/bin:$PATH
#dalla version conda >=4.2 non esiste piu' la get_proxy_server dal modulo config 
#facendo rompere tutte le nostre  build!!!
# python==2.7.14 
conda install --yes conda-build pip jinja2==2.8 anaconda-client Cython==0.24 numpy==1.10.4
conda update --yes conda-build
conda config --add channels https://conda.anaconda.org/t/$BINSTAR_TOKEN/prometeia/channel/pytho
conda config --add channels https://conda.anaconda.org/t/$BINSTAR_TOKEN/prometeia
conda config --set channel_priority false
conda install --yes 'promebuilder' 'Cython==0.28.*'
