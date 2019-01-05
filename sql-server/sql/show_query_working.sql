-- 実行中のクエリを特定する
select
  sql.text                      sql_text,
  req.session_id                session_id,
  req.status                    status,
  req.command                   command,
  req.total_elapsed_time / 1000 elapsed_time_seconds,
  req.start_time                start_time
from
  sys.dm_exec_requests req
  cross apply sys.dm_exec_sql_text(req.sql_handle) sql

-- 実行中のクエリを特定する
SELECT
    r.session_id,
    r.start_time,
    TotalElapsedTime_ms = r.total_elapsed_time,
    r.[status],
    r.command,
    DatabaseName = DB_Name(r.database_id),
    r.wait_type,
    r.last_wait_type,
    r.wait_resource,
    r.cpu_time,
    r.reads,
    r.writes,
    r.logical_reads,
    t.[text] AS [executing batch]
FROM
    sys.dm_exec_requests r
CROSS APPLY
    sys.dm_exec_sql_text(r.sql_handle) AS t
ORDER BY
    r.total_elapsed_time DESC;