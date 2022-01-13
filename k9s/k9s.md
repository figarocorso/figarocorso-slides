---

date: ""
author: Platform Team
theme: https://github.com/maaslalani/slides/raw/main/styles/theme.json
paging: Page %d of %d
---

# K9s Exercises

1. Configure kubeconfig against running cluster
2. Create custom application
3. Download and run K9s
4. Enter your application
5. Debug our application
6. Fix our application
7. Executing command inside pod
8. Trying out xray
9. Port forwarding

---

# Configure kubeconfig against running cluster

## Have you updated your MFA token?

```bash
$ docker run -it -v $HOME/.aws:/aws -v $HOME/.kube:/kube docker.internal.sysdig.com/utils/gimme-aws-creds:latest
$ export AWS_PROFILE=draios-dev-developer
$ aws s3 ls # test connection
$ aws sts get-caller-identity # who you are ;-)
```

## Run osc.py export

```bash
$ cd ~/sysdig/automation/onprem-automation
$ python osc.py list | grep demo
$ python osc.py export qa-workshop-demo
```

Did it fail complaining about `CA private key was not found`?
Just download latest kops (1.22+): https://kops.sigs.k8s.io/getting_started/install/

## Check K8s API connection

```
$ kubectl get nodes -o wide
```

---

# Create custom application

Download voting app scripts or clone https://github.com/figarocorso/figarocorso-slides :

* https://raw.githubusercontent.com/figarocorso/figarocorso-slides/main/k9s/example-voting-app.yaml.tpl
* https://raw.githubusercontent.com/figarocorso/figarocorso-slides/main/k9s/deploy_custom_vote_app.sh

```bash
$ ./deploy_custom_vote_app.sh 
Namespace: vote31845  # your ID is 31845, remember this number <APP_ID>
Results URL http://<IP>:31845
Results URL http://<IP>:31846

namespace/vote31845 created
deployment.apps/db created
service/db created
deployment.apps/redis created
service/redis created
deployment.apps/result created
service/result created
deployment.apps/vote created
namespace/vote created
service/vote created
deployment.apps/worker created
```

If we have any error saying port is already in use or so, it looks like we weren't lucky using `$RANDOM` (just ping us and retry the command)

---

# Download and run K9s

## Install or download the binary

* You can install K9s using brew, port, pacman, scoop, choco: https://k9scli.io/topics/install/

Or... download the binary
* Go to K9s Github project and download the binary for your workstation: https://github.com/derailed/k9s/releases/tag/v0.24.15
  * Linux x86_64: https://github.com/derailed/k9s/releases/download/v0.24.15/k9s_Linux_x86_64.tar.gz
  * MacOs x86_64: https://github.com/derailed/k9s/releases/download/v0.24.15/k9s_Darwin_x86_64.tar.gz
  * Windows x86_64: https://github.com/derailed/k9s/releases/download/v0.24.15/k9s_Windows_x86_64.tar.gz

## [Optiona] Add the binary to your path or install

If you downloaded the binary you would like to do something like:

```bash
$ tar xzf k9s_Linux_x86_64.tar.gz
$ sudo mv k9s /usr/bin/.
```

## Run!!!

```bash
$ k9s
```

---

# Enter your application

## What is the IP of my app?

```bash
🐶> :nodes
🐶> control + w  # toggle wide mode
```

Check the public IP column there (any node public IP should work 😜)

## Let's open your favourite browser

* Current poll results (live update): http://[public IP]:<APP_ID>
* Voting UI: http://[public IP]:<APP_ID + 1>

## Is the app working?

* Results are `50% vs. 50%` normal when no vote has been emited
* Just vote for your choice at the voting UI
* Now you should be showing `100% vs. 0%`
* But... nothing has changed, right?

---

# Debug our application

## Listing your application pods

```bash
🐶> :namespaces  # List namespaces (alias :ns)
🐶> /APP_ID  # Filter your namespace
# Use the arrows and select that namespace <ENTER>
# Now you are seeing the 5 pods at that namespace
```

## Retrieving the pods logs

```bash
# Use the arrows and press to select a pod and then press 
🐶> l
# When you are done reviewing the logs press just go back by
🐶> <ESC>
# You can see quick summary of a pod by just pressing
🐶> <ENTER>
```

## What is going on here?

It actually looks like there is someting wrong with DB, let's kill the pod

```bash
# Select the pod using the arrows
🐶> <CONTROL> + d  # and confirm the deletion
```

## Fixed?

---

# Fix our application

## Editing a deployment

```bash
🐶> :deployment  # or just :deploy
# select the `db` deployment
🐶> e  # let's edit it
```

Add under `- env:` section, close to `POSTGRES_USER` block the following key/value entry:

```yaml
- name: POSTGRES_HOST_AUTH_METHOD
  value: trust
```

You are at VIM, so save changes and exit with `:wq`

## Is it already working?

* Try to change your vote, is result being updated?
* If the app is not working it might be necessary to kill the result pod so it reconnects to the DB.:

---

# Executing command inside pod

## Exec into postgres container

```bash
🐶> :pod
# select db pod
🐶> s
```

## Let's list the issues votes

```
$ psql --username postgres
$ \l  # list databases
$ \c postgres  # connect to postgres database
$ \dt  # list tables
$ SELECT * FROM votes;
# \q or <control> + d will work for exiting when needed
```

---

# Trying out xray

Let's switch to our beloved `sysdigcloud` namespace:

```bash
🐶> :namespaces  # List namespaces (alias :ns)
🐶> /sysdigcloud # press <ENTER> to confirm filter
🐶> <ENTER>  # to list namespace pods
🐶> :xray deployments
🐶> :xray pods
```

* Could we see a secret?
  * Select a secret `<ENTER>` and press `x` to decode
* What about a config map?
  * Select a secret `<ENTER>` and press `y` to validate its contents

---

# Extra Ball: Port forwarding

We can use k9s to establish a port-forward. We will use this feature to access a private API endpoint from our local machine.

```bash
🐶> :pods # List pods
# Select meerkat-api pod
🐶> :d # press d to see pod description
# Look for the readiness probe port
# Go back to pod list
# Highlight meerkat-api pod
🐶> :Shift + f # Open the new port forward dialog
Container port: <actuator_port>
Local Port: 29111
Address localhost
# Hit OK
```

This opens a port forward from your local port directly to meerekat-api container port.

Now we can reach that private API port directly. Open a **new terminal** and do the following:

```bash
🐶> curl localhost:29111/actuator/health
```

---

# Extra Ball: Delete port forwarding

The port forward will be destroyed when we exit k9s, but you can also:

```bash
🐶> :pods # List pods
# Highlight meerkat-api pod
🐶> :f # Press f to select the port forward
🐶> control + d # Delete the port forward
```

---

# Extra Ball: Popeye

```bash
🐶> :popeye
🐶> :<ENTER> # Hit enter and wait for results
```

The popeye tool will show problems and warnings detected in the cluster.

---

# That's all! Q&A time
