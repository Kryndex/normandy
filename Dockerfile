FROM python:3.5.1-slim
WORKDIR /app
RUN groupadd --gid 1001 app && useradd -g app --uid 1001 --shell /usr/sbin/nologin app
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc libpq-dev

COPY ./requirements.txt /app/requirements.txt
RUN pip install -U 'pip>=8' && pip install --upgrade --no-cache-dir -r requirements.txt

COPY . /app
RUN DJANGO_CONFIGURATION=Build ./manage.py collectstatic --no-input && \
    mkdir -p media && chown app:app media && \
    mkdir -p __version__ && \
    # Get the current git commit. Done by hand to avoid installing Git.
    cat .git/$(cat .git/HEAD | awk '{print $2}') > __version__/commit && \
    rm -rf .git

USER app
ENV DJANGO_SETTINGS_MODULE=normandy.settings \
    DJANGO_CONFIGURATION=Production \
    PORT=8000
EXPOSE $PORT
CMD gunicorn normandy.wsgi:application --log-file -
