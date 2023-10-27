FROM node:20.9-bullseye-slim as base

# Working directory
WORKDIR /usr/app

# Copying the package.json
COPY package*.json .


FROM base as prod

# setting the node environment
ENV NODE_ENV production

# installing the dependencies
RUN --mount=type=cache,target=/usr/app/.npm \
    npm set cache /usr/app/.npm && \
    npm ci --only=production 

# configuring non root user
USER node

# copying the source code
COPY --chown=node:node . .

CMD ["node","server.js"]