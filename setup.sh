#!/bin/bash
CONDADIR=$(dirname "$(which conda)")
CONDADIR=$(dirname "$CONDADIR")
CONDA="$CONDADIR/etc/profile.d/conda.sh"
if ! [ -f "$CONDA" ]; then
		echo "Conda is not installed. Usage: setup.sh <conda dir>"
		exit
fi
echo "Conda: $CONDA"
echo "Conda directory: $CONDADIR"
source $CONDA
conda create -n cgcms-ecis-screen -y 
conda activate cgcms-ecis-screen
conda install -y perl-bioperl hmmer
conda deactivate
chmod 755 filter_hmmtab.pl
chmod 755 gbk2IDs.pl
chmod 755 gbk2seq.pl
chmod 755 hmmsearch2tab.pl
chmod 755 HMMsearch_genomesII.pl
chmod 755 parse_hmmtab4eCIS.pl
echo "Done. Run \"conda activate cgcms-ecis-screen\", then run HMMsearch_genomesII.pl"