FROM node:20-alpine

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH

# Copy package.json and package-lock.json separately to leverage Docker cache
COPY frontend/package.json ./
COPY frontend/package-lock.json ./

RUN npm install
RUN npm i react-icons 
RUN npm install sass \ 
    && npm install sass -g\
    && npm install -D sass \
    && npm install -g sass \
    && npm i react-router-dom

# Add app
COPY frontend/ .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]
