"""
Forensic.py
===========
Determine which of the jobs in a job array failed to execute
"""

import argparse
import subprocess
import re

# PARSE ARGS ###################################################################
PARSER = argparse.ArgumentParser(
    description="Determine which of the subprocessses failed"
)
PARSER.add_argument(
    "job_id",
    nargs="+",
    help="SGE job ID of the job array to investigate"
)
ARGS = vars(PARSER.parse_args())

# GET LAST JOB ID IF NECESSARY #################################################
JOB_IDS = ARGS["job_id"]
if JOB_IDS == "-":
    USER = str(subprocess.check_output(["whoami"]))
    QACCT_OUTPUT = subprocess.check_output(["qacct", "-o", USER])
    LINES = QACCT_OUTPUT.split("\\n")
    TASK_NUM_RE = re.compile(r"jobnumber\s+(\w+)")
    for line in reversed(LINES):
        task_num_check = TASK_NUM_RE.match(line)
        if task_num_check is not None:
            JOB_IDS = [task_num_check.group(1)]
            break

for job_id in JOB_IDS:
    # GET JOB INFO #############################################################
    QACCT_OUTPUT = subprocess.check_output(["qacct", "-j", job_id])
    QACCT_OUTPUT = str(QACCT_OUTPUT)
    LINES = QACCT_OUTPUT.split("\\n")

    # PARSE QACCT OUTPUT #######################################################
    task_id = ""
    job_name = ""
    task_id_re = re.compile(r"taskid\s+(\d+)")
    job_name_re = re.compile(r"jobname\s+(\w+)")
    # jobname      H1ESC-100bp
    abnormal_exit_re = re.compile(r"exit_status\s+([1-9]\d*)")
    for line in LINES:
        job_num_check = task_id_re.match(line)
        if job_num_check is not None:
            task_id = job_num_check.group(1)
        job_name_check = job_name_re.match(line)
        if job_name_check is not None:
            job_name = job_name_check.group(1)
        abnormal_exit_check = abnormal_exit_re.match(line)
        if abnormal_exit_check is not None:
            print("{0} {1}.{2}:{3}".format(job_name, job_id, task_id, line))
