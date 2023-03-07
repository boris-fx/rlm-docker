FROM rockylinux:9
RUN dnf -y update
RUN dnf -y install chkconfig
RUN SAPPHIRE_SILENT=1 dnf -y install https://cdn.borisfx.com/borisfx/store/BorisFX-RLM-14.1.1.0-1.x86_64.rpm
CMD ["/usr/borisfx/rlm/rlm", "-c", "/licenses/", "-dlog", "/logs/rlm-borisfx.log"]
EXPOSE 5053 5054 5153
