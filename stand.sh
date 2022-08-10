#!/bin/bash

# Set SPARK_HOME to switch to different versions.
export SPARK_HOME='/usr/local/spark-3.2.1-bin-hadoop3.2'
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='lab --ip=0.0.0.0 --port 8888 --allow-root --no-browser --NotebookApp.token=""'
export JARS="${HOME}/WS/bdt3/bdt3-make/target/bdt-3.1.0-3.2.0-2.12-SNAPSHOT.jar"
export PYFILES="${HOME}/WS/bdt3/bdt3-py/dist/bdt-3.1.0+snapshot-py3.10.egg"

export SPARK_WORKER_CORES=6
export SPARK_WORKER_MEMORY=24g
export SPARK_WORKER_INSTANCES=2

bash $SPARK_HOME/sbin/start-master.sh
bash $SPARK_HOME/sbin/start-worker.sh spark://$HOSTNAME:7077

${SPARK_HOME}/bin/pyspark\
  --master spark://$HOSTNAME:7077\
  --conf "spark.driver.cores=1"\
  --conf "spark.driver.memory=1g"\
  --conf "spark.executor.cores=1"\
  --conf "spark.executor.memory=4g"\
  --conf spark.ui.enabled=true\
  --conf spark.ui.showConsoleProgress=true\
  --conf spark.sql.catalogImplementation=in-memory\
  --conf spark.sql.execution.arrow.pyspark.enabled=true\
  --conf spark.memory.offHeap.size=31G\
  --conf spark.memory.offHeap.enabled=true\
  --conf spark.kryo.unsafe=true\
  --conf spark.serializer=org.apache.spark.serializer.KryoSerializer\
  --conf spark.submit.pyFiles="${PYFILES}"\
  --conf spark.jars="${JARS}"

bash $SPARK_HOME/sbin/stop-worker.sh
bash $SPARK_HOME/sbin/stop-master.sh

unset SPARK_WORKER_CORES
unset SPARK_WORKER_MEMORY
unset SPARK_WORKER_INSTANCES

rm derby.log
rm -r metastore_db