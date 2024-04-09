FROM node:20-alpine

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH

# Copy package.json and package-lock.json separately to leverage Docker cache
COPY frontend/package.json ./
COPY frontend/package-lock.json ./

RUN npm install

# Add app
COPY frontend/ .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]
