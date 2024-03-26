FROM python:3.11-slim-buster

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV HOST 0.0.0.0
ENV PORT=8000

WORKDIR /app/

CMD tail -f /dev/null
#ENTRYPOINT [while true; do sleep 1; done]
COPY ./requirements.txt /app/requirements.txt
#COPY ./models /app/
RUN apt-get update &&  apt-get install build-essential -y 
RUN pip install --upgrade pip &&  pip install -r requirements.txt

# Run the server
CMD python3 -m llama_cpp.server --model functionary-small-v2.2.q4_0.gguf  --hf_pretrained_model_name_or_path meetkai/functionary-small-v2.2-GGUF --chat_format functionary-v2  --hf_model_repo_id meetkai/functionary-small-v2.2-GGUF 
