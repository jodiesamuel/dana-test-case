FROM python:3

ADD extract_json_to_csv.py /

RUN pip install pystrich

CMD [ "python", "./extract_json_to_csv.py" ]
