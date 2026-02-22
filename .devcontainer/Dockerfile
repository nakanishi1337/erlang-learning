FROM erlang:26

# デフォルトシェルをbashに設定
SHELL ["/bin/bash", "-c"]

# OS パッケージ（必要最低限）
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# VS Code 用ユーザー
RUN useradd -m vscode
USER vscode
WORKDIR /workspace