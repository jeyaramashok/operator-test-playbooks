FROM registry.access.redhat.com/ubi8/python-36

# Install ansible, operator-courier and python dependencies
COPY build/requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

WORKDIR /playbook

# Copy playbook and roles
COPY . .

# RUN ansible-playbook local-test-operator.yml -i "localhost," --tags "install-prereqs"

ENTRYPOINT ["./run.sh"]
