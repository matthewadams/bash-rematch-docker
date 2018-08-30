FROM bash:4.4

COPY ./match.sh /match.sh
RUN chmod +x /match.sh

ENTRYPOINT [ "/match.sh" ]
CMD [ "help" ]
