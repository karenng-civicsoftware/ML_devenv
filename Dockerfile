# ======================================================================
# usage: docker run -ti -p 8888:8888 karenyng/ml_devenv:latest 
# within the container, use jupyter notebook with:
# $ jupyter notebook --ip 0.0.0.0 --no-browser --allow-root -v ${PWD}:/code/DataScience
# then navigate to your local browser and go to the url:
# 127.0.0.1:8888
# ======================================================================
FROM karenyng/miniconda3_devenv:latest
MAINTAINER Karen Ng <karen.yyng@gmail.com>

RUN conda config --add channels conda-forge
RUN conda upgrade -y conda && conda clean --all
RUN conda install -c intel intelpython3_core=2019 \
	scikit-learn  \
    && conda clean --all
RUN python -c 'import numpy'

RUN conda install \     
	pyarrow=0.11.1 \
	bokeh=1.0.4 \
	pytest=4.1.1 \ 
	sphinx \
	jupyter=1.0.0 \
	pandas \
	matplotlib \
	xlrd=1.2.0 \
&& conda clean --all
# RUN conda install pytorch torchvision -c pytorch \
# && conda clean --all

RUN python -c 'import numpy'

RUN pip install --no-cache-dir --upgrade \
    xgboost==0.81 \
    intel-tensorflow==1.12.0 \
    featexp==0.0.5 \
    lime==0.1.1.32 \
    gym==0.9.6 \
    recommonmark==0.5.0 \
    sphinx-markdown-tables

# check if the installations were successful
RUN python -c 'import xgboost' 
RUN python -c 'import lime' 
RUN python -c 'import sklearn' 
RUN python -c 'import tensorflow' 
RUN python -c 'import featexp' 
RUN python -c 'import pandas' 
RUN python -c 'import gym' 
