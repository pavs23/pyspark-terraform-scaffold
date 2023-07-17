
resource "databricks_job" "bronze_job" {
  
  name = "Bronze Job"

  job_cluster {
    job_cluster_key = "bronze_cluster"

    # add whatever config you need

  }

  task {
    task_key = "bronze_autoloader"

    notebook_task {
      notebook_path = databricks_notebook.bronze_notebook.path
    }
  }

}

data "databricks_current_user" "me" {}

resource "databricks_notebook" "bronze_notebook" {
  source = "${path.module}/deltalake/bronze/play.py"
  path   = "${data.databricks_current_user.me.home}/AA/BB/CC"
}