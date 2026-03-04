FROM alpine:3.20

WORKDIR /app

COPY my-infrastructure ./my-infrastructure
COPY README.md ./README.md

CMD ["sh", "-c", "echo Container build for CI succeeded"]
