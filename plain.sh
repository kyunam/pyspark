#!/bin/bash

export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='lab --ip=0.0.0.0 --port 8888 --allow-root --no-browser --NotebookApp.token=""'

${SPARK_HOME}/bin/pyspark\
  --master local[*]\
  --conf spark.driver.memory=31G\
  --conf spark.ui.enabled=true\
  --conf spark.ui.showConsoleProgress=true\
  --conf spark.sql.catalogImplementation=in-memory\
  --conf spark.sql.execution.arrow.pyspark.enabled=true\
  --conf spark.memory.offHeap.size=31G\
  --conf spark.memory.offHeap.enabled=true\
  --conf spark.kryo.unsafe=true\
  --conf spark.serializer=org.apache.spark.serializer.KryoSerializer
