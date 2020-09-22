FROM hyperledger/besu:latest
COPY --chown=besu:besu --from=bitsler/wallet-base-node:latest /usr/local/.nvm /opt/besu/.nvm
RUN chmod +x /opt/besu/.nvm/nvm.sh
ENV NVM_DIR /opt/besu/.nvm
ENV NODE_VERSION 12.18.4
RUN . $NVM_DIR/nvm.sh && nvm use $NODE_VERSION

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

COPY --chown=besu:besu entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["pm2-runtime", "/usr/local/bin/entrypoint.sh", "-n","$WALLET_NAME","--deep-monitoring", "--"]


