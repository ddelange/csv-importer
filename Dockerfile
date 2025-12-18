# base image
FROM pelias/baseimage

# change working dir
ENV WORKDIR /code/pelias/csv-importer
WORKDIR ${WORKDIR}

# copy package.json first to prevent npm install being rerun when only code changes
COPY ./package.json ${WORKDIR}
RUN npm install

# copy code into image
ADD . ${WORKDIR}

USER pelias

# run tests
RUN npm test
