#
# Dockerfile for openrefine-reconcile-csv
#

FROM java:8-jre-alpine

MAINTAINER kev <noreply@easypi.pro>

ADD http://okfnlabs.org/reconcile-csv/dist/reconcile-csv-0.1.2.jar /app/

WORKDIR /data

EXPOSE 8000

CMD java -jar /app/reconcile-csv-0.1.2.jar "${CSV_FILE}" "${SEARCH_COLUMN}" "${ID_COLUMN}"
