
resource "databricks_job" "silver_job" {
  
  name = "Silver Job"

  job_cluster {
    job_cluster_key = "silver_cluster"

    # add whatever config you need

  }

  task {
    task_key = "silver_autoloader"

    notebook_task {
      notebook_path = databricks_notebook.silver_notebook.path
    }
  }

}

data "databricks_current_user" "me" {}

resource "databricks_notebook" "silver_notebook" {
  source = "${path.module}/deltalake/silver/play.py"
  path   = "${data.databricks_current_user.me.home}/AA/BB/CC"
}