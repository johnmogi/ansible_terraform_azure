# ansible playbook instructions
hello and welcome to the world of ansible

[]: # Language: YML
[]: # Path: deploy_files/play.yml
[]: # Path: deploy_files/README.md


At the server side, run the following command:

```

# staging - check if the servers are running:
Staging public ip: 20.124.5.101
ping 10.0.20.4
ping 10.0.20.5

# production - check if the servers are running:
prod public ip: 20.124.177.159
ping 10.0.20.4
ping 10.0.20.5
ping 10.0.20.6

you'll need to provide the psecret key for each of the servers:
<pre>
psecret.yml:
PIP : < public ip staging or production >
COOKIE : < okta cookie >
ENV : production
PHOST : < http://${ PIP }:8080 >
PUSER : < postgres username >
PDB : <postgres database server name >
PPASS : < postgres password >
PPORT : < postgres port >
PKTA : < okta dev domain ip as in dev-123456.okta.com > // in this exact format
OCLIENT : < okta client >
OSECRET : < okta secret >
</pre>

```

now you are ready to run the playbook:
ansible-playbook play.yml

will run over the required steps tp install application configuration over your server fleet.
I hope you enjoy the experience.
