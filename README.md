## Set up `PySpark` & `Jupyter Notebook`

0. Assumptions
   - No `SPARK_HOME` environment variable is set.
   - `PATH` environment variable doesn't have the `bin` directory in the full spark installation directory.
1. Install `conda`.
2. ```shell
    conda create -n pyspark
    conda activate pyspark
    conda install -c conda-forge pyspark=3.2.1 jupyterlab
   ```
3. (Optional) In IntelliJ, add python SDK.

   ![Add Python SDK](media/add_python_sdk.png)

4. Start `PySpark` with `Jupyter Notebook` by `./local.sh`

## TODO

- Set up for `local-cluster` and `spark://`.
- Try `spark.pyspark.python`, `spark.pyspark.driver.python`

## References

- [To use the Jupyter,](https://spark.apache.org/docs/latest/rdd-programming-guide.html#using-the-shell)
   ```shell
   $ PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS=notebook ./bin/pyspark
   ```
   You can customize the `jupyter` commands by setting `PYSPARK_DRIVER_PYTHON_OPTS`.

- https://spark.apache.org/docs/latest/rdd-programming-guide.html#using-the-shell
- https://spark.apache.org/docs/latest/configuration.html#environment-variables
- https://www.bmc.com/blogs/jupyter-notebooks-apache-spark/