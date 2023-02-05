FROM node:16-alpine3.16 as builder

ENV NODE_ENV build

WORKDIR /home/node

COPY --chown=node:node . .

RUN npm i -g @nestjs/cli

RUN npm ci

RUN npm run build  \
    && npm prune --production



FROM node:16-alpine3.16

ENV NODE_ENV production

WORKDIR /home/node

COPY --chown=node:node entrypoint.sh entrypoint.sh
COPY --chown=node:node prod.entrypoint.sh prod.entrypoint.sh
COPY --chown=node:node dev.entrypoint.sh dev.entrypoint.sh
COPY --chown=node:node stage.entrypoint.sh stage.entrypoint.sh

COPY --from=builder --chown=node:node /home/node/package*.json ./
COPY --from=builder --chown=node:node /home/node/node_modules/ ./node_modules/
COPY --from=builder --chown=node:node /home/node/dist/ ./dist/

USER node
RUN ["chmod", "+x", "./entrypoint.sh"]
ENTRYPOINT [ "./entrypoint.sh" ]