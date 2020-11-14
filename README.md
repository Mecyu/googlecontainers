# docker release version
### 2020-11-09 2.5.0.1

* Upgrades

- [Compose CLI v1.0.2](https://github.com/docker/compose-cli/releases/tag/v1.0.2)
- [Snyk v1.424.2](https://github.com/snyk/snyk/releases/tag/v1.424.4)

* Bug fixes and minor changes
- Fixed an issue that caused Docker Desktop to crash on MacOS 11.0 (Big Sur) when VirtualBox was also installed. See [docker/for-mac#4997](https://github.com/docker/for-mac/issues/4997).

### 2020-11-09 2.5.0.0

This release contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after install.

* New
  - Users subscribed to a Pro or a Team plan can now see the vulnerability scan report on the Remote repositories tab in Docker Desktop.
  - Docker Desktop introduces a support option for users who have subscribed to a Pro or a Team Plan.

* Upgrades
  - [Linux kernel 5.4.39](https://hub.docker.com/layers/linuxkit/kernel/5.4.39-f39f83d0d475b274938c86eaa796022bfc7063d2/images/sha256-8614670219aca0bb276d4749e479591b60cd348abc770ac9ecd09ee4c1575405?context=explore)
  - [Docker Compose CLI 1.0.1](https://github.com/docker/compose-cli/releases/tag/v1.0.1)
  - [Snyk v1.421.1](https://github.com/snyk/snyk/releases/tag/v1.421.1)
  - [Go 1.15.2](https://github.com/golang/go/releases/tag/go1.15.2)
  - [Kubernetes 1.19.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.19.3)
  
* Bug fixes and minor changes
  - Renamed 'Run Diagnostics' to 'Get support'.
  - Removed BlueStacks warning message. Fixes [docker/for-mac#4863](https://github.com/docker/for-mac/issues/4863).
  - Made container start faster in cases where shared volumes have lots of files. Fixes [docker/for-mac#4957](https://github.com/docker/for-mac/issues/4957).
  - File sharing: fixed changing ownership of read-only files. Fixes [docker/for-mac#4989](https://github.com/docker/for-mac/issues/4989), [docker/for-mac#4964](https://github.com/docker/for-mac/issues/4964).
  - File sharing: generated `ATTRIB` inotify events as well as `MODIFY`. Fixes [docker/for-mac#4962](https://github.com/docker/for-mac/issues/4962).
  - File sharing: returned `EOPNOTSUPP` from `fallocate` for unsupported modes. Fixes `minio`. Fixes [docker/for-mac#4964](https://github.com/docker/for-mac/issues/4964).
  - File sharing: fixed a possible premature file handle close.
  - When sharing Linux directories (`/var`, `/bin`, etc) with containers, Docker Desktop avoids watching paths in the host file system.
  - When sharing a file into a container (e.g. `docker run -v ~/.gitconfig`) Docker Desktop does not watch the parent directory. Fixes [docker/for-mac#4981](https://github.com/docker/for-mac/issues/4981), [docker/for-mac#4975](https://github.com/docker/for-mac/issues/4975).
  - Fixed an issue related to NFS mounting. Fixes [docker/for-mac#4958](https://github.com/docker/for-mac/issues/4958).
  - Allow symlinks to point outside of shared volumes. Fixes [docker/for-mac#4862](https://github.com/docker/for-mac/issues/4862).
  - Diagnostics: avoid hanging when Kubernetes is in a broken state.
  - Docker Desktop now supports `S_ISUID`, `S_ISGID` and `S_ISVTX` in calls to `chmod(2)` on shared filesystems. Fixes [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943).

### 2020-09-30 2.4.0.0

* New
  - [Docker Compose CLI - 0.1.18](https://github.com/docker/compose-cli), enabling use of volumes with Compose and the Cloud through ECS and ACI.
  - Docker introduces the new Images view in the Docker Dashboard. The images view allows users to view the Hub images, pull them and manage their local images on disk including cleaning up unwanted and unused images. To access the new Images view, from the Docker menu, select 'Dashboard' > 'Images'
  - Docker Desktop now enables BuildKit by default after a reset to factory defaults. To revert to the old docker build experience, go to `Preferences` > `Docker Engine` and then disable the BuildKit feature.
  - [Amazon ECR Credential Helper](https://github.com/awslabs/amazon-ecr-credential-helper/releases/tag/v0.4.0)
  - Docker Desktop now uses much less CPU when there are lots of file events on the host and when running Kubernetes, see [docker/roadmap#12](https://github.com/docker/roadmap/issues/12).

* Upgrades
  - [Docker 19.03.13](https://github.com/docker/docker-ce/releases/tag/v19.03.13)
  - [Docker Compose 1.27.4](https://github.com/docker/compose/releases/tag/1.27.4)
  - [Go 1.14.7](https://github.com/golang/go/releases/tag/go1.14.7)
  - [Alpine 3.12](https://alpinelinux.org/posts/Alpine-3.12.0-released.html)
  - [Kubernetes 1.18.8](https://github.com/kubernetes/kubernetes/releases/tag/v1.18.8)
  - [Qemu 4.2.0](https://git.qemu.org/?p=qemu.git;a=tag;h=1e4aa2dad329852aa6c3f59cefd65c2c2ef2062c)

* Bug fixes and minor changes
  - Docker Desktop on macOS 10.13 is now deprecated.
  - Removed the legacy Kubernetes context `docker-for-desktop`. The context `docker-desktop` should be used instead. Fixes [docker/for-win#5089](https://github.com/docker/for-win/issues/5089) and [docker/for-mac#4089](https://github.com/docker/for-mac/issues/5089).
  - Adding the application to the dock and clicking on it will launch the container view if Docker is already running.
  - Add support for emulating Risc-V via Qemu 4.2.0.
  - Removed file descriptor limit (`setrlimit`) of `10240`. We now rely on the kernel to impose limits via `kern.maxfiles` and `kern.maxfilesperproc`.
  - Fixed a Mac CPU usage bug by removing the serial console from `hyperkit`, see [docker/roadmap#12]( https://github.com/docker/roadmap/issues/12#issuecomment-663163280). To open a shell in the VM use either `nc -U ~/Library/Containers/com.docker.docker/Data/debug-shell.sock`.
  - Reduced CPU usage when there are lots of filesystem changes on the host, see [docker/roadmap#12](https://github.com/docker/roadmap/issues/12#issuecomment-652894544).
  - Copy container logs without ansi colors to clipboard. Fixes [docker/for-mac#4786](https://github.com/docker/for-mac/issues/4786).
  - Fixed automatic start on log in. See [docker/for-mac#4877] and [docker/for-mac#4890].
  - Fixed bug where the application won't start if the username is too long.
  - Fixed a bug where adding directories like `/usr` to the filesharing list prevents Desktop from starting. Fixes [docker/for-mac#4488](https://github.com/docker/for-mac/issues/4488)
  - Fixed application startup if `hosts` is specified inside the Docker `daemon.json`. See [docker/for-win#6895](https://github.com/docker/for-win/issues/6895#issuecomment-637429117)
  - Docker Desktop always flush filesystem caches synchronously on container start. See [docker/for-mac#4943](https://github.com/docker/for-mac/issues/4943).

* Known Issues
  -  There is a known issue when using `docker-compose` with named volumes and gRPC FUSE: second and subsequent calls to `docker-compose up` will fail due to the volume path having the prefix `/host_mnt`. A work around is to switch back to `osxfs` in Settings. See [docker/for-mac#4859](https://github.com/docker/for-mac/issues/4859).

### 2020-07-27 2.3.0.4

* Upgrades
  - [Docker 19.03.12](https://github.com/docker/docker-ce/releases/tag/v19.03.12)
  - [Docker Compose 1.26.2](https://github.com/docker/compose/releases/tag/1.26.2)
  - [Go 1.13.14](https://github.com/golang/go/issues?q=milestone%3AGo1.13.14+label%3ACherryPickApproved)

* Bug fixes and minor changes
  - Fixed a privilege escalation vulnerability in `com.docker.vmnetd`. See [CVE-2020-15360](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-15360)
  - Fixed an issue with startup when the Kubernetes certificates have expired. See [docker/for-mac#4594](https://github.com/docker/for-mac/issues/4594)
  - Fix an incompatibility between `hyperkit` and [osquery](https://osquery.io) which resulted in excessive `hyperkit` CPU usage. See [docker/for-mac#3499](https://github.com/docker/for-mac/issues/3499#issuecomment-619544836)
  - Dashboard: Fixed containers logs which were sometimes truncated. Fixes [docker/for-win#5954](https://github.com/docker/for-win/issues/5954)

### 2020-05-27 2.3.0.3

* Upgrades
  - [Linux kernel 4.19.76](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-83885d3b4cff391813f4262099b36a529bca2df8-amd64/images/sha256-0214b82436af70054e013ea51cb1fea72bd943d0d6245b6521f1ff09a505c40f?context=explore)

* Bug fixes and minor changes
  - Re-added device-mapper to the embedded Linux kernel. Fixes [docker/for-mac#4549](https://github.com/docker/for-mac/issues/4549).
  - Fixed `hyperkit` on newer Macs / newer versions of `Hypervisor.framework`. Fixes [docker/for-mac#4562](https://github.com/docker/for-mac/issues/4562).

### 2020-05-11 2.3.0.2

* New
  - Docker Desktop introduces a new onboarding tutorial upon first startup. The Quick Start tutorial guides users to get started with Docker in a few easy steps. It includes a simple exercise to build an example Docker image, run it as a container, push and save the image to Docker Hub.

* Upgrades
  - [Docker Compose 1.25.5](https://github.com/docker/compose/releases/tag/1.25.5)
  - [Go 1.13.10](https://github.com/golang/go/issues?q=milestone%3AGo1.13.10+label%3ACherryPickApproved)
  - [Linux kernel 4.19.76](https://hub.docker.com/layers/docker/for-desktop-kernel/4.19.76-ce15f646db9b062dc947cfc0c1deab019fa63f96-amd64/images/sha256-6c252199aee548e4bdc8457e0a068e7d8e81c2649d4c1e26e4150daa253a85d8?context=repo)
  - LinuxKit [init](https://hub.docker.com/layers/linuxkit/init/1a80a9907b35b9a808e7868ffb7b0da29ee64a95/images/sha256-64cc8fa50d63940dbaa9979a13c362c89ecb4439bcb3ab22c40d300b9c0b597e?context=explore), [runc](https://hub.docker.com/layers/linuxkit/runc/69b4a35eaa22eba4990ee52cccc8f48f6c08ed03/images/sha256-57e3c7cbd96790990cf87d7b0f30f459ea0b6f9768b03b32a89b832b73546280?context=explore) and [containerd](https://hub.docker.com/layers/linuxkit/containerd/09553963ed9da626c25cf8acdf6d62ec37645412/images/sha256-866be7edb0598430709f88d0e1c6ed7bfd4a397b5ed220e1f793ee9067255ff1?context=explore)

* Bug fixes and minor changes
  - Fixed bug where containers disappeared from the UI when Kubernetes context is invalid. Fixed [docker/for-win#6037](https://github.com/docker/for-win/issues/6037).
  - Fixed a file descriptor leak in `vpnkit-bridge`. Fixed [docker/for-win#5841](https://github.com/docker/for-win/issues/5841).
  - Added a link to the Edge channel from the UI.
  - Made the embedded terminal resizable.
  - Fixed bug where diagnostic upload would fail if the username contained spaces.
  - Fixed a bug where the Docker UI could be started without the engine.
  - Switched from `ahci-hd` to `virtio-blk` to avoid an AHCI deadlock, see [moby/hyperkit#94](https://github.com/moby/hyperkit/issues/94) and [docker/for-mac#1835](https://github.com/docker/for-mac/issues/1835).
  - Fixed an issue where a container port could not be exposed on a specific host IP. See [docker/for-mac#4209](https://github.com/docker/for-mac/issues/4209).
  - Removed port probing from dashboard, just unconditionally showing links to ports that should be available. Fixes [docker/for-mac#4264](https://github.com/docker/for-mac/issues/4264).
  - Docker Desktop now shares `/var/folders` by default as it stores per-user temporary files and caches.
  - Ceph support has been removed from Docker Desktop to save disk space.
  - Fixed a performance regression when using shared volumes in 2.2.0.5. Fixes [docker/for-mac#4423].

### 2020-04-02 2.2.0.5

* Bug fixes and minor changes
  - Removed dangling `/usr/local/bin/docker-machine` symlinks which avoids custom installs of  Docker Machine being accidentally deleted in future upgrades. Note that if you have installed Docker Machine manually, then the install might have followed the symlink and installed Docker Machine in `/Applications/Docker.app`. In this case, you must manually reinstall Docker Machine after installing this version of Docker Desktop. Fixes [docker/for-mac#4208](https://github.com/docker/for-mac/issues/4208).

### 2020-03-13 2.2.0.4

* Upgrades
  - [Docker 19.03.8](https://github.com/docker/docker-ce/releases/tag/v19.03.8)

* Bug fixes and minor changes
  - Kubernetes: Persistent volumes created by claims are now stored in the virtual machine. Fixes [docker/for-win#5665](https://github.com/docker/for-win/issues/5665).
  - Fixed an issue which caused Docker Desktop Dashboard to attempt connecting to all exposed ports inside a container. Fixes [docker/for-mac#4264](https://github.com/docker/for-mac/issues/4264).

### 2020-02-12 2.2.0.3

* Upgrades
  - [Docker Compose 1.25.4](https://github.com/docker/compose/releases/tag/1.25.4)
  - [Go 1.12.16](https://golang.org/doc/devel/release.html#go1.12)

### 2020-01-21 2.2.0.0

This release contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after install.

* Upgrades
  - [Docker Compose 1.25.2](https://github.com/docker/compose/releases/tag/v1.25.2)
  - [Kubernetes 1.15.5](https://github.com/kubernetes/kubernetes/releases/tag/v1.15.5)
  - Linux kernel 4.19.76
  - [Qemu 4.0.1](https://github.com/docker/binfmt) for cross compiling for ARM

* New
  - Docker Desktop Dashboard: The new Docker Desktop Dashboard provides a user-friendly interface which enables you to interact with containers and applications, and manage the lifecycle of your applications directly from the UI. In addition, it allows you to access the logs, view container details, and monitor resource utilization to explore the container behavior. To access the new Dashboard UI, select the Docker menu from the Mac menu bar and then click Dashboard.
  - Introduced a new user interface for the Docker Desktop Preferences menu.
  - The Restart, Reset, and Uninstall options are now available on the Troubleshoot menu.
  - Added the ability to start and stop existing Compose-based applications and view combined logs in the Docker Desktop Dashboard UI.

* Bug fixes and minor changes
  - Added missing fish completions for Docker Compose [docker/for-mac#3795](https://github.com/docker/for-mac/issues/3795).
  - Fixed a bug that did not allow users to copy and paste any text in the Preferences > Daemon window [docker/for-mac#3798](https://github.com/docker/for-mac/issues/3798).
  - Added support for Expect: 100-continue headers in the Docker API proxy. Some HTTP clients such as curl send this header when the payload is large, for example, when creating containers. Fixes [moby/moby#39693](https://github.com/moby/moby/issues/39693).
  - Added a loading overlay to the Settings and Troubleshoot windows to prevent editing conflicts.
  - Deactivated the Reset Kubernetes button when Kubernetes is not activated.
  - Improved the navigation in Settings and Troubleshoot UI.
  - Fixed a bug in the UEFI boot menu that sometimes caused Docker Desktop to hang during restart. Fixes [docker/for-mac#3921](https://github.com/docker/for-mac/issues/3921).
  - Docker Desktop now allows users to access the host’s SSH agent inside containers. Fixes [docker/for-mac#410](https://github.com/docker/for-mac/issues/410).
  - Docker Machine is no longer included in the Docker Desktop installer. You can download it separately from the [Docker Machine releases](https://github.com/docker/machine/releases) page.
  - Fixed an issue that caused VMs running on older hardware with macOS Catalina to fail on startup with the error processor does not support desired secondary processor-based controls.
  - Fixed port forwarding when containers are using overlay networks.
  - Fixed a container start error when a container has more than one port with an arbitrary or not-yet-configured external port number. For example, docker run -p 80 -p 443 nginx. Fixes [docker/for-win#4935](https://github.com/docker/for-win/issues/4935) and [docker/compose#6998](https://github.com/docker/compose/issues/6998).
  - Fixed an issue that occurs when sharing overlapping directories.
  - Fixed a bug that prevented users from changing the location of the VM disk image.
  - Docker Desktop does not inject inotify events on directories anymore as these can cause mount points to disappear inside containers. Fixes [docker/for-mac#3976](https://github.com/docker/for-mac/issues/3976).
  - Fixed an issue that caused Docker Desktop to fail on startup when there is an incomplete Kubernetes config file.
  - Fixed an issue where attempts to log into Docker through Docker Desktop could sometimes fail with the Incorrect authentication credentials error. Fixes [docker/for-mac#4010](https://github.com/docker/for-mac/issues/4010).
  - Warn users about container data loss when resizing the disk image. Fixed [docker/for-win#4725](https://github.com/docker/for-win/issues/4725).

* Known issues
  - When you start a Docker Compose application and then start a Docker App which has the same name as the Compose application, Docker Desktop displays only one application on the Dashboard. However, when you expand the application, containers that belong to both applications are displayed on the Dashboard.
  - When you deploy a Docker App with multiple containers on Kubernetes, Docker Desktop displays each Pod as an application on the Dashboard.

### 2019-11-18 2.1.0.5

This release contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after install.

* Upgrades
  - [Docker 19.03.5](https://github.com/docker/docker-ce/releases/tag/v19.03.5)
  - [Kubernetes 1.14.8](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.8)
  - [Go 1.12.13](https://golang.org/doc/devel/release.html#go1.12)

### 2019-10-21 2.1.0.4

This release contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after install.

* Upgrades
  - [Docker 19.03.4](https://github.com/docker/docker-ce/releases/tag/v19.03.4)
  - [Kubernetes 1.14.7](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.7)
  - [Go 1.12.10](https://github.com/golang/go/issues?q=milestone%3AGo1.12.10+label%3ACherryPickApproved)
  - [Kitematic 0.17.9](https://github.com/docker/kitematic/releases/tag/v0.17.9)

### 2019-09-16 2.1.0.3

* Upgrades
  - [Kitematic 0.17.8](https://github.com/docker/kitematic/releases/tag/v0.17.8)

* Bug fixes and minor changes
  - All binaries that make up Docker Desktop are now notarized so that it can run on macOS Catalina, for more information see [Notarization Requirement for Mac Software](https://developer.apple.com/news/?id=06032019i).

### 2019-09-04 2.1.0.2

This release contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after install.

* Upgrades
  - [Docker 19.03.2](https://github.com/docker/docker-ce/releases/tag/v19.03.2)
  - [Kubernetes 1.14.6](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.6)
  - [Go 1.12.9](https://github.com/golang/go/issues?q=milestone%3AGo1.12.9+label%3ACherryPickApproved)
  - [Docker Machine 0.16.2](https://github.com/docker/machine/releases/tag/v0.16.2)  

### 2019-08-07 2.1.0.1

This release contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after install.

* Upgrades
  - [Hyperkit 0.20190802](https://github.com/moby/hyperkit/releases/tag/v0.20190802)
  - [Docker 19.03.1](https://github.com/docker/docker-ce/releases/tag/v19.03.1)
  - [Docker Compose 1.24.1](https://github.com/docker/compose/releases/tag/1.24.1)
  - [Kubernetes 1.14.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.3)
  - [Compose on Kubernetes 0.4.23](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.23)
  - [Docker Machine 0.16.1](https://github.com/docker/machine/releases/tag/v0.16.1)
  - [linuxkit v0.7](https://github.com/linuxkit/linuxkit/releases/tag/v0.7)
  - Linux Kernel 4.9.184
  - [Kitematic 0.17.6](https://github.com/docker/kitematic/releases/tag/v0.17.6)
  - [Qemu 4.0.0](https://github.com/docker/binfmt) for cross compiling for ARM
  - [Alpine 3.10](https://alpinelinux.org/posts/Alpine-3.10.0-released.html)
  - [Docker Credential Helpers 0.6.3](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.3)

* New
  - Checking the experimental checkbox in Daemon Preferences will turn on experimental features for docker daemon AND docker CLI.
  - Improve reliability of `com.docker.osxfs trace` performance profiling command.
  - Add `com.docker.osxfs trace --summary` option for a high-level summary of operations, rather than a trace of all operations.
  - Support DNS large lists of resource records on Mac. Fixes [docker/for-mac#2160](https://github.com/docker/for-mac/issues/2160#issuecomment-431571031)

* Experimental
  - App: Docker CLI Plugin to configure, share and install applications
     - Extend Compose files with metadata and parameters
     - Re-use same application across multiple environments (Development/QA/Staging/Production)
     - Multi orchestrator installation (Swarm or Kubernetes)
     - Push/Pull/Promotion/Signing supported for application, with same workflow as images
     - Fully CNAB compliant
     - Full support of Docker Contexts
  - Buildx (Tech Preview): Docker CLI plugin for extended build capabilities with BuildKit
     - Familiar UI from docker build
     - Full BuildKit capabilities with container driver
     - Multiple builder instance support
     - Multi-node builds for cross-platform images (out-of-the-box support for linux/arm/v7 & linux/arm64)
     - Parallel building of compose files
     - High-level build constructs with `bake`

* Bug fixes and minor changes
  - Docker Desktop now allows users to expose privileged UDP ports [docker/for-mac#3775](https://github.com/docker/for-mac/issues/3775).
  - Fix an issue where running some Docker commands can fail if you are not using Credential Helpers [docker/for-mac#3785](https://github.com/docker/for-mac/issues/3785).
  - Change the host's kubernetes context so that `docker run -v .kube:kube ... kubectl` works.
  - Restrict cluster-admin role on local Kubernetes cluster to kube-system namespace.
  - Reduce startup time: swap is not recreated for each virtual machine boot
  - Fix Kubernetes installation with VPNkit subnet.
  - Fix occasional crash when gathering diagnostics on windows due to process output not being redirected to stdout.
  - Add /etc/machine-id in the virtual machine. Fixes [docker/for-mac#3554](https://github.com/docker/for-mac/issues/3554).
  - Stop sending DNS queries for `docker-desktop.<domain>` every 10s. Rely on the host's DNS domain search order rather than trying to replicate it inside the VM.
  - Removed the ability to log in using your email address as a username. The docker command line does not support this.
  - Allow running a Docker registry in a container again. Fixes [docker/for-mac#3611](https://github.com/docker/for-mac/issues/3611)
  - Fix a stability issue with the DNS resolver.
  - Truncate UDP DNS responses which are over 512 bytes in size
  - Fix port 8080 that was used on localhost when starting Kubernetes. Fixes [docker/for-mac#3522](https://github.com/docker/for-mac/issues/3522)
  - Error message improvements, do not propose to run diagnostics / reset to factory default when not appropriate.
  - Kubernetes: use default maximum number of pods for kubelet. [docker/for-mac#3453](https://github.com/docker/for-mac/issues/3453)
  - Fix DockerHelper crash. [docker/for-mac#3470](https://github.com/docker/for-mac/issues/3470)
  - Fix binding of privileged ports with specified IP. [docker/for-mac#3464](https://github.com/docker/for-mac/issues/3464)
  - Fix service log collection in diagnostics
  - Gather /etc/hosts to help diagnostics
  - Ensure localhost resolves to 127.0.0.1. Related to [docker/for-mac#2990](https://github.com/docker/for-mac/issues/2990#issuecomment-443097942), [docker/for-mac#3383](https://github.com/docker/for-mac/issues/3383)
  - Partially open services ports if possible. [docker/for-mac#3438](https://github.com/docker/for-mac/issues/3438)

### 2019-07-31 2.1.0.0

This release contains a Kubernetes upgrade. Your local Kubernetes cluster will be reset after install.

* Upgrades
  - [Docker 19.03.1](https://github.com/docker/docker-ce/releases/tag/v19.03.1)
  - [Docker Compose 1.24.1](https://github.com/docker/compose/releases/tag/1.24.1)
  - [Kubernetes 1.14.3](https://github.com/kubernetes/kubernetes/releases/tag/v1.14.3)
  - [Compose on Kubernetes 0.4.23](https://github.com/docker/compose-on-kubernetes/releases/tag/v0.4.23)
  - [Docker Machine 0.16.1](https://github.com/docker/machine/releases/tag/v0.16.1)
  - [linuxkit v0.7](https://github.com/linuxkit/linuxkit/releases/tag/v0.7)
  - Linux Kernel 4.9.184
  - [Kitematic 0.17.6](https://github.com/docker/kitematic/releases/tag/v0.17.6)
  - [Qemu 4.0.0](https://github.com/docker/binfmt) for cross compiling for ARM
  - [Alpine 3.10](https://alpinelinux.org/posts/Alpine-3.10.0-released.html)
  - [Docker Credential Helpers 0.6.3](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.3)

* New
  - Checking the experimental checkbox in Daemon Preferences will turn on experimental features for docker daemon AND docker CLI.
  - Improve reliability of `com.docker.osxfs trace` performance profiling command.
  - Add `com.docker.osxfs trace --summary` option for a high-level summary of operations, rather than a trace of all operations.
  - Support DNS large lists of resource records on Mac. Fixes [docker/for-mac#2160](https://github.com/docker/for-mac/issues/2160#issuecomment-431571031)

* Experimental
  - App: Docker CLI Plugin to configure, share and install applications
     - Extend Compose files with metadata and parameters
     - Re-use same application across multiple environments (Development/QA/Staging/Production)
     - Multi orchestrator installation (Swarm or Kubernetes)
     - Push/Pull/Promotion/Signing supported for application, with same workflow as images
     - Fully CNAB compliant
     - Full support of Docker Contexts
  - Buildx (Tech Preview): Docker CLI plugin for extended build capabilities with BuildKit
     - Familiar UI from docker build
     - Full BuildKit capabilities with container driver
     - Multiple builder instance support
     - Multi-node builds for cross-platform images (out-of-the-box support for linux/arm/v7 & linux/arm64)
     - Parallel building of compose files
     - High-level build constructs with `bake`

* Bug fixes and minor changes
  - Change the host's kubernetes context so that `docker run -v .kube:kube ... kubectl` works.
  - Restrict cluster-admin role on local Kubernetes cluster to kube-system namespace.
  - Reduce startup time: swap is not recreated for each virtual machine boot
  - Fix Kubernetes installation with VPNkit subnet.
  - Fix occasional crash when gathering diagnostics on windows due to process output not being redirected to stdout.
  - Add /etc/machine-id in the virtual machine. Fixes [docker/for-mac#3554](https://github.com/docker/for-mac/issues/3554).
  - Stop sending DNS queries for `docker-desktop.<domain>` every 10s. Rely on the host's DNS domain search order rather than trying to replicate it inside the VM.
  - Removed the ability to log in using your email address as a username. The docker command line does not support this.
  - Allow running a Docker registry in a container again. Fixes [docker/for-mac#3611](https://github.com/docker/for-mac/issues/3611)
  - Fix a stability issue with the DNS resolver.
  - Truncate UDP DNS responses which are over 512 bytes in size
  - Fix port 8080 that was used on localhost when starting Kubernetes. Fixes [docker/for-mac#3522](https://github.com/docker/for-mac/issues/3522)
  - Error message improvements, do not propose to run diagnostics / reset to factory default when not appropriate.
  - Kubernetes: use default maximum number of pods for kubelet. [docker/for-mac#3453](https://github.com/docker/for-mac/issues/3453)
  - Fix DockerHelper crash. [docker/for-mac#3470](https://github.com/docker/for-mac/issues/3470)
  - Fix binding of privileged ports with specified IP. [docker/for-mac#3464](https://github.com/docker/for-mac/issues/3464)
  - Fix service log collection in diagnostics
  - Gather /etc/hosts to help diagnostics
  - Ensure localhost resolves to 127.0.0.1. Related to [docker/for-mac#2990](https://github.com/docker/for-mac/issues/2990#issuecomment-443097942), [docker/for-mac#3383](https://github.com/docker/for-mac/issues/3383)
  - Partially open services ports if possible. [docker/for-mac#3438](https://github.com/docker/for-mac/issues/3438)

### 2019-02-15 2.0.0.3
 
* Upgrades
  - [Docker 18.09.2](https://github.com/docker/docker-ce/releases/tag/v18.09.2), fixes [CVE-2019-5736](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-5736)
 
### 2019-01-16 2.0.0.2
 
* Upgrades
  - [Docker 18.09.1](https://github.com/docker/docker-ce-packaging/releases/tag/v18.09.1)
  - [Docker Machine 0.16.1](https://github.com/docker/machine/releases/tag/v0.16.1)
  - [Kubernetes 1.10.11](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.10.md#v11011), fixes [CVE-2018-1002105](https://github.com/kubernetes/kubernetes/issues/71411)
  - [Kitematic 0.17.6](https://github.com/docker/kitematic/releases/tag/v0.17.6)
  - Golang 1.10.6, fixes CVEs: [CVE-2018-16875](https://www.cvedetails.com/cve/CVE-2018-16875), [CVE-2018-16873](https://www.cvedetails.com/cve/CVE-2018-16873) and [CVE-2018-16874](https://www.cvedetails.com/cve/CVE-2018-16874)
 
* Bug fixes and minor changes
  - Add 18.09 missing daemon options
 
### 2018-11-30 2.0.0.0-win81
 
* Upgrades
  - [Docker compose 1.23.2](https://github.com/docker/compose/releases/tag/1.23.2)
 
### 2018-11-19 2.0.0.0-mac78

* Upgrades
  - [Docker 18.09.0](https://github.com/docker/docker-ce-packaging/releases/tag/v18.09.0)
  - [Docker compose 1.23.1](https://github.com/docker/compose/releases/tag/1.23.1)
  - [Docker Machine 0.16.0](https://github.com/docker/machine/releases/tag/v0.16.0)
  - [Kitematic 0.17.5](https://github.com/docker/kitematic/releases/tag/v0.17.5)
  - Linux Kernel 4.9.125

* New
  - New version scheme

* Deprecation
  - Removed support of AUFS
  - Removed support of OSX 10.11

* Bug fixes and minor changes
  - Fix appearance in dark mode for OSX 10.14 (Mojave)
  - VPNKit: Improved scalability of port forwarding. Related to [docker/for-mac#2841](https://github.com/docker/for-mac/issues/2841)
  - VPNKit: Limit the size of the UDP NAT table. This ensures port forwarding and regular TCP traffic continue even when running very chatty UDP protocols.
  - Ensure Kubernetes can be installed when using a non-default internal IP subnet.
  - Fix panic in diagnose

### 2018-08-29 18.06.1-ce-mac73

* Upgrades
  - [Docker 18.06.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.1-ce)

* Bug fixes and minor changes
  - Fix local DNS failing to resolve inside containers.

### 2018-07-25 18.06.0-ce-mac70

* Upgrades
  - [Docker 18.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce)
  - [Docker Machine 0.15.0](https://github.com/docker/machine/releases/tag/v0.15.0)
  - [Docker compose 1.22.0](https://github.com/docker/compose/releases/tag/1.22.0)
  - [LinuxKit v0.5](https://github.com/linuxkit/linuxkit/releases/tag/v0.5)
  - Linux Kernel 4.9.93 with CEPH, DRBD, RBD, MPLS_ROUTING and MPLS_IPTUNNEL enabled

* New
  - Kubernetes Support. You can now run a single-node Kubernetes cluster from the "Kubernetes" Pane in Docker For Mac Preferences and use kubectl commands as well as docker commands. See https://docs.docker.com/docker-for-mac/kubernetes/
  - Add an experimental SOCKS server to allow access to container networks, see [docker/for-mac#2670](https://github.com/docker/for-mac/issues/2670#issuecomment-372365274). Also see [docker/for-mac#2721](https://github.com/docker/for-mac/issues/2721)
  - Re-enable raw as the the default disk format for users running macOS 10.13.4 and higher. Note this change only takes effect after a "reset to factory defaults" or "remove all data" (from the Whale menu -> Preferences -> Reset). Related to [docker/for-mac#2625](https://github.com/docker/for-mac/issues/2625)

* Bug fixes and minor changes
  - AUFS storage driver is deprecated in Docker Desktop and AUFS support will be removed in the next major release. You can continue with AUFS in Docker Desktop 18.06.x, but you will need to reset disk image (in Preferences > Reset menu) before updating to the next major update. You can check documentation to [save images](https://docs.docker.com/engine/reference/commandline/save/#examples) and [backup volumes](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes)
  - OS X El Capitan 10.11 is deprecated in Docker Desktop. You will not be able to install updates after Docker Desktop 18.06.x. We recommend upgrading to the latest version of macOS.
  - Fix bug which would cause VM logs to be written to RAM rather than disk in some cases, and the VM to hang. See [docker/for-mac#2984](https://github.com/docker/for-mac/issues/2984)
  - Fix network connection leak triggered by haproxy TCP health-checks [docker/for-mac#1132](https://github.com/docker/for-mac/issues/1132)
  - Better message to reset vmnetd when it's disabled. See [docker/for-mac#3035](https://github.com/docker/for-mac/issues/3035)
  - Fix VPNKit memory leak. Fixes [moby/vpnkit#371](https://github.com/moby/vpnkit/issues/371)
  - Virtual Machine default disk path is stored relative to $HOME. Fixes [docker/for-mac#2928](https://github.com/docker/for-mac/issues/2928), [docker/for-mac#1209](https://github.com/docker/for-mac/issues/1209)
  - Use Simple NTP to minimise clock drift between the VM and the host. Fixes [docker/for-mac#2076](https://github.com/docker/for-mac/issues/2076)
  - Fix a race between calling stat on a file and calling close of a file descriptor referencing the file that could result in the stat failing with EBADF (often presented as "File not found"). Fixes [docker/for-mac#2870](https://github.com/docker/for-mac/issues/2870)
  - Do not allow install of Docker for Mac on macOS Yosemite 10.10, this version is not supported since Docker for Mac 17.09.0.
  - Fix button order in reset dialog windows. Fixes [docker/for-mac#2827](https://github.com/docker/for-mac/issues/2827)
  - Fix upgrade straight from pre-17.12 versions where Docker for Mac cannot restart once the upgrade has been performed. Fixes [docker/for-mac#2739](https://github.com/docker/for-mac/issues/2739)
  - Added log rotation for docker-ce logs inside the virtual machine.

### 2018-04-30 18.03.1-ce-mac65

* Upgrades
  - [Docker compose 1.21.1](https://github.com/docker/compose/releases/tag/1.21.1)

### 2018-04-26 18.03.1-ce-mac64

* Upgrades
  - [Docker 18.03.1-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.1-ce)
  - [Docker compose 1.21.0](https://github.com/docker/compose/releases/tag/1.21.0)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)

### 2018-03-30 18.03.0-ce-mac60

* Upgrades
  - [Docker 18.03.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce)
  - [Docker Machine 0.14.0](https://github.com/docker/machine/releases/tag/v0.14.0)
  - [Docker compose 1.20.1](https://github.com/docker/compose/releases/tag/1.20.1)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
  - Linux Kernel 4.9.87
  - AUFS 20180312

* New
  - VM Swap size can be changed in settings. See [docker/for-mac#2566](https://github.com/docker/for-mac/issues/2566), [docker/for-mac#2389](https://github.com/docker/for-mac/issues/2389)
  - New menu item to restart Docker.
  - Support NFS Volume sharing.
  - The directory holding the disk images has been renamed (from `~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux` to ~/Library/Containers/com.docker.docker/Data/vms/0`).

* Bug fixes and minor changes
  - Fix daemon not starting properly when setting TLS-related options. Fixes [docker/for-mac#2663](https://github.com/docker/for-mac/issues/2663)
  - DNS name `host.docker.internal` shoud be used for host resolution from containers. Older aliases (still valid) are deprecated in favor of this one. (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
  - Fix for the HTTP/S transparent proxy when using "localhost" names (e.g. `host.docker.internal`).
  - Fix empty registry added by mistake in some cases in the Preference Daemon Pane. Fixes [docker/for-mac#2537](https://github.com/docker/for-mac/issues/2537)
  - Clearer error message when incompatible hardware is detected.
  - Fix some cases where selecting "Reset" after an error did not reset properly.
  - Fix incorrect ntp config. Fixes [docker/for-mac#2529](https://github.com/docker/for-mac/issues/2529)
  - Migration of Docker Toolbox images is not proposed anymore in Docker For Mac installer (still possible to [migrate Toolbox images manually](https://docs.docker.com/docker-for-mac/docker-toolbox/#migrating-from-docker-toolbox-to-docker-for-mac) ).

### 2018-03-15 18.03.0-ce-rc4-mac57

* Upgrades
  - [Docker 18.03.0-ce](https://github.com/docker/docker-ce/releases/tag/v18.03.0-ce)
  - [Docker Machine 0.14.0](https://github.com/docker/machine/releases/tag/v0.14.0)
  - [Docker compose 1.20.1](https://github.com/docker/compose/releases/tag/1.20.1)
  - [Notary 0.6.1](https://github.com/docker/notary/releases/tag/v0.6.1)
  - Linux Kernel 4.9.87
  - AUFS 20180312

* New
  - VM Swap size can be changed in settings. See [docker/for-mac#2566](https://github.com/docker/for-mac/issues/2566), [docker/for-mac#2389](https://github.com/docker/for-mac/issues/2389)
  - New menu item to restart Docker.
  - Support NFS Volume sharing.
  - The directory holding the disk images has been renamed (from `~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux` to ~/Library/Containers/com.docker.docker/Data/vms/0`).

* Bug fixes and minor changes
  - Fix daemon not starting properly when setting TLS-related options. Fixes [docker/for-mac#2663](https://github.com/docker/for-mac/issues/2663)
  - DNS name `host.docker.internal` shoud be used for host resolution from containers. Older aliases (still valid) are deprecated in favor of this one. (See https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06).
  - Fix for the HTTP/S transparent proxy when using "localhost" names (e.g. `host.docker.internal`).
  - Fix empty registry added by mistake in some cases in the Preference Daemon Pane. Fixes [docker/for-mac#2537](https://github.com/docker/for-mac/issues/2537)
  - Clearer error message when incompatible hardware is detected.
  - Fix some cases where selecting "Reset" after an error did not reset properly.
  - Fix incorrect ntp config. Fixes [docker/for-mac#2529](https://github.com/docker/for-mac/issues/2529)
  - Migration of Docker Toolbox images is not proposed anymore in Docker For Mac installer (still possible to [migrate Toolbox images manually](https://docs.docker.com/docker-for-mac/docker-toolbox/#migrating-from-docker-toolbox-to-docker-for-mac) ).

### 2018-02-27 17.12.0-ce-mac55

* Bug fixes and minor changes
  - Revert the default disk format to qcow2 for users running macOS 10.13 (High Sierra). There are confirmed reports of file corruption using the raw format which uses sparse files on APFS. Note this change only takes effect after a reset to factory defaults (from the Whale menu -> Preferences -> Reset). Related to [docker/for-mac#2625](https://github.com/docker/for-mac/issues/2625)
  - Fix VPNKit proxy for docker.for.mac.http.internal.

### 2018-01-18 17.12.0-ce-mac49

* Upgrades
  - [Docker 17.12.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce)
  - [Docker compose 1.18.0](https://github.com/docker/compose/releases/tag/1.18.0)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
  - Linux Kernel 4.9.60

* New
  - VM entirely built with Linuxkit.
  - VM disk size can be changed in disk preferences. (See [docker/for-mac#1037](https://github.com/docker/for-mac/issues/1037))
  - For systems running APFS on SSD on High Sierra, use `raw` format VM disks by default. This improves disk throughput (from 320MiB/sec to 600MiB/sec in `dd` on a 2015 MacBook Pro) and disk space handling.
  Existing disks are kept in qcow format, if you want to switch to raw format you need to "Remove all data" or "Reset to factory defaults". See https://docs.docker.com/docker-for-mac/faqs/#disk-usage
  - DNS name `docker.for.mac.host.internal` shoud be used instead of `docker.for.mac.localhost` (still valid) for host resolution from containers, since since there is an RFC banning the use of subdomains of localhost. See  https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06.

* Bug fixes and minor changes
  - Fix error during resize/create Docker.raw disk image in some cases. Fixes [docker/for-mac#2383](https://github.com/docker/for-mac/issues/2383), [docker/for-mac#2447](https://github.com/docker/for-mac/issues/2447), [docker/for-mac#2453], (https://github.com/docker/for-mac/issues/2453), [docker/for-mac#2420](https://github.com/docker/for-mac/issues/2420)
  - Fix additional allocated disk space not available in containers. Fixes [docker/for-mac#2449](https://github.com/docker/for-mac/issues/2449)
  - Vpnkit port max idle time default restored to 300s. Fixes [docker/for-mac#2442](https://github.com/docker/for-mac/issues/2442)
  - Fix using an HTTP proxy with authentication. Fixes [docker/for-mac#2386](https://github.com/docker/for-mac/issues/2386)
  - Allow HTTP proxy excludes to be written as .docker.com as well as *.docker.com
  - Allow individual IP addresses to be added to HTTP proxy excludes.
  - Avoid hitting DNS timeouts when querying docker.for.mac.* when the upstream DNS servers are slow or missing.
  - Fix for `docker push` to an insecure registry. Fixes [docker/for-mac#2392](https://github.com/docker/for-mac/issues/2392)
  - Separate internal ports used to proxy HTTP and HTTPS content.
  - Display various component versions in About box.
  - Avoid VM reboot when changing host proxy settings.
  - Don't break HTTP traffic between containers by forwarding them via the external proxy. (See [docker/for-mac#981](https://github.com/docker/for-mac/issues/981))
  - Filesharing settings are now stored in settings.json.
  - Daemon restart button has been moved to settings / Reset Tab.
  - Better VM state handling & error messsages in case of VM crashes.
  - Fix login into private repository with certificate issue. (See [docker/for-mac#2201](https://github.com/docker/for-mac/issues/2201))

### 2018-01-12 17.12.0-ce-mac47

* Upgrades
  - [Docker 17.12.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce)
  - [Docker compose 1.18.0](https://github.com/docker/compose/releases/tag/1.18.0)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
  - Linux Kernel 4.9.60

* New
  - VM entirely built with Linuxkit.
  - VM disk size can be changed in disk preferences. (See [docker/for-mac#1037](https://github.com/docker/for-mac/issues/1037))
  - For systems running APFS on SSD on High Sierra, use `raw` format VM disks by default. This improves disk throughput (from 320MiB/sec to 600MiB/sec in `dd` on a 2015 MacBook Pro) and disk space handling.
  Existing disks are kept in qcow format, if you want to switch to raw format you need to "Remove all data" or "Reset to factory defaults". See https://docs.docker.com/docker-for-mac/faqs/#disk-usage
  - DNS name `docker.for.mac.host.internal` shoud be used instead of `docker.for.mac.localhost` (still valid) for host resolution from containers, since since there is an RFC banning the use of subdomains of localhost. See  https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06.

* Bug fixes and minor changes
  - Fix for `docker push` to an insecure registry. Fixes [docker/for-mac#2392](https://github.com/docker/for-mac/issues/2392)
  - Separate internal ports used to proxy HTTP and HTTPS content.
  - Display various component versions in About box.
  - Avoid VM reboot when changing host proxy settings.
  - Don't break HTTP traffic between containers by forwarding them via the external proxy. (See [docker/for-mac#981](https://github.com/docker/for-mac/issues/981))
  - Filesharing settings are now stored in settings.json.
  - Daemon restart button has been moved to settings / Reset Tab.
  - Better VM state handling & error messsages in case of VM crashes.
  - Fix login into private repository with certificate issue. (See [docker/for-mac#2201](https://github.com/docker/for-mac/issues/2201))

### 2017-01-09 17.12.0-ce-mac46

* Upgrades
  - [Docker 17.12.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.12.0-ce)
  - [Docker compose 1.18.0](https://github.com/docker/compose/releases/tag/1.18.0)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)
  - Linux Kernel 4.9.60

* New
  - VM entirely built with Linuxkit
  - VM disk size can be changed in disk preferences. (See [docker/for-mac#1037](https://github.com/docker/for-mac/issues/1037))
  - For systems running APFS on SSD on High Sierra, use `raw` format VM disks by default. This improves disk throughput (from 320MiB/sec to 600MiB/sec in `dd` on a 2015 MacBook Pro) and disk space handling.
  Existing disks are kept in qcow format, if you want to switch to raw format you need to "Remove all data" or "Reset to factory defaults". See https://docs.docker.com/docker-for-mac/faqs/#disk-usage
  - DNS name `docker.for.mac.host.internal` shoud be used instead of `docker.for.mac.localhost` (still valid) for host resolution from containers, since since there is an RFC banning the use of subdomains of localhost. See  https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-06.

* Bug fixes and minor changes
  - Display various component versions in About box.
  - Avoid VM reboot when changing host proxy settings.
  - Don't break HTTP traffic between containers by forwarding them via the external proxy. (See [docker/for-mac#981](https://github.com/docker/for-mac/issues/981))
  - Filesharing settings are now stored in settings.json.
  - Daemon restart button has been moved to settings / Reset Tab.
  - Better VM state handling & error messsages in case of VM crashes.
  - Fix login into private repository with certificate issue. (See [docker/for-mac#2201](https://github.com/docker/for-mac/issues/2201))

### 2017-12-08 17.09.1-ce-mac42

* Upgrades
  - [Docker 17.09.1-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.1-ce)
  - [Docker compose 1.17.1](https://github.com/docker/compose/releases/tag/1.17.1)
  - [Docker Machine 0.13.0](https://github.com/docker/machine/releases/tag/v0.13.0)

* Bug fixes and minor changes
  - Fix bug not allowing to move qcow disk in some cases.

### 2017-10-06 17.09.0-ce-mac35

* Upgrades
  - [Docker 17.09.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)
  - [Docker compose 1.16.1](https://github.com/docker/compose/releases/tag/1.16.1)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
  - [Docker Credential Helpers 0.6.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.0)
  - Linux Kernel 4.9.49
  - AUFS 20170911
  - DataKit update (fix instability on High Sierra)

* New
  - Add daemon options validation
  - VPNKit: add support for ping!
  - VPNKit: add slirp/port-max-idle-timeout to allow the timeout to be adjusted or even disabled
  - VPNKit: bridge mode is default everywhere now
  - Transparent proxy using macOS system proxies (if defined) directly
  - GUI settings are now stored in ~/Library/Group\ Containers/group.com.docker/settings.json. daemon.json in now a file in ~/.docker/
  - You can now change the default IP address used by Hyperkit if it collides with your network

* Bug fixes and minor changes
  - Fix Docker For Mac unable to start in some cases: removed use of libgmp sometimes causing the vpnkit process to die.
  - Do not show Toolbox migration assistant when there are existing Docker For Mac data.
  - Fix instability on High Sierra (docker/for-mac#2069, docker/for-mac#2062, docker/for-mac#2052, docker/for-mac#2029, docker/for-mac#2024)
  - Fix password encoding/decoding (docker/for-mac#2008, docker/for-mac#2016, docker/for-mac#1919, docker/for-mac#712, docker/for-mac#1220).
  - Kernel: Enable TASK_XACCT and TASK_IO_ACCOUNTING (docker/for-mac#1608)
  - Rotate logs in the VM more often
  - VPNKit: change protocol to support error messages reported back from the server
  - VPNKit: fix a bug which causes a socket to leak if the corresponding TCP connection is idle
    for more than 5 minutes (related to [docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374))
  - VPNKit: improve the logging around the Unix domain socket connections
  - VPNKit: automatically trim whitespace from int or bool database keys
  - Diagnose can be cancelled & Improved help information. Fixes docker/for-mac#1134, docker/for-mac#1474
  - Support paging of docker-cloud repositories & orgs. Fixes docker/for-mac#1538

### 2017-10-03 17.09.0-ce-mac33

* Upgrades
  - [Docker 17.09.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)
  - [Docker compose 1.16.1](https://github.com/docker/compose/releases/tag/1.16.1)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
  - [Docker Credential Helpers 0.6.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.0)
  - Linux Kernel 4.9.49
  - AUFS 20170911
  - DataKit update (fix instability on High Sierra)

* New
  - Add daemon options validation
  - VPNKit: add support for ping!
  - VPNKit: add slirp/port-max-idle-timeout to allow the timeout to be adjusted or even disabled
  - VPNKit: bridge mode is default everywhere now
  - Transparent proxy using macOS system proxies (if defined) directly
  - GUI settings are now stored in ~/Library/Group\ Containers/group.com.docker/settings.json. daemon.json in now a file in ~/.docker/
  - You can now change the default IP address used by Hyperkit if it collides with your network

* Bug fixes and minor changes
  - Do not show Toolbox migration assistant when there are existing Docker For Mac data.
  - Fix instability on High Sierra (docker/for-mac#2069, docker/for-mac#2062, docker/for-mac#2052, docker/for-mac#2029, docker/for-mac#2024)
  - Fix password encoding/decoding (docker/for-mac#2008, docker/for-mac#2016, docker/for-mac#1919, docker/for-mac#712, docker/for-mac#1220).
  - Kernel: Enable TASK_XACCT and TASK_IO_ACCOUNTING (docker/for-mac#1608)
  - Rotate logs in the VM more often
  - VPNKit: change protocol to support error messages reported back from the server
  - VPNKit: fix a bug which causes a socket to leak if the corresponding TCP connection is idle
    for more than 5 minutes (related to [docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374))
  - VPNKit: improve the logging around the Unix domain socket connections
  - VPNKit: automatically trim whitespace from int or bool database keys
  - Diagnose can be cancelled & Improved help information. Fixes docker/for-mac#1134, docker/for-mac#1474
  - Support paging of docker-cloud repositories & orgs. Fixes docker/for-mac#1538

### 2017-10-02 17.09.0-ce-mac32

* Upgrades
  - [Docker 17.09.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)
  - [Docker compose 1.16.1](https://github.com/docker/compose/releases/tag/1.16.1)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)
  - [Docker Credential Helpers 0.6.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.6.0)
  - Linux Kernel 4.9.49
  - AUFS 20170911
  - DataKit update (fix instability on High Sierra)

* New
  - Add daemon options validation
  - VPNKit: add support for ping!
  - VPNKit: add slirp/port-max-idle-timeout to allow the timeout to be adjusted or even disabled
  - VPNKit: bridge mode is default everywhere now
  - Transparent proxy using macOS system proxies (if defined) directly
  - GUI settings are now stored in ~/Library/Group\ Containers/group.com.docker/settings.json. daemon.json in now a file in ~/.docker/
  - You can now change the default IP address used by Hyperkit if it collides with your network

* Bug fixes and minor changes
  - Fix instability on High Sierra (docker/for-mac#2069, docker/for-mac#2062, docker/for-mac#2052, docker/for-mac#2029, docker/for-mac#2024)
  - Fix password encoding/decoding (docker/for-mac#2008, docker/for-mac#2016, docker/for-mac#1919, docker/for-mac#712, docker/for-mac#1220).
  - Kernel: Enable TASK_XACCT and TASK_IO_ACCOUNTING (docker/for-mac#1608)
  - Rotate logs in the VM more often
  - VPNKit: change protocol to support error messages reported back from the server
  - VPNKit: fix a bug which causes a socket to leak if the corresponding TCP connection is idle
    for more than 5 minutes (related to [docker/for-mac#1374](https://github.com/docker/for-mac/issues/1374))
  - VPNKit: improve the logging around the Unix domain socket connections
  - VPNKit: automatically trim whitespace from int or bool database keys
  - Diagnose can be cancelled & Improved help information. Fixes docker/for-mac#1134, docker/for-mac#1474
  - Support paging of docker-cloud repositories & orgs. Fixes docker/for-mac#1538

### 2017-09-06 17.06.2-ce-mac27

* Upgrades
  - [Docker 17.06.2-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.2-ce)
  - [Docker Machine 0.12.2](https://github.com/docker/machine/releases/tag/v0.12.2)

### 2017-08-22 17.06.1-ce-mac24

* Upgrades
  - [Docker 17.06.1-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.1-ce)

### 2017-07-13 17.06.0-ce-mac19

* Upgrades
  - Linux Kernel 4.9.36
  - AUFS 20170703

* Bug fixes and minor changes
  - DNS Fixes. Fixes docker/for-mac#1763, docker/for-mac#1811, docker/for-mac#1803
  - Avoid unnecessary VM reboot (when changing proxy exclude, but no proxy set). Fixes docker/for-mac#1809, docker/for-mac#1801

### (2017-06-28) 17.06.0-ce-mac18

* Upgrades
  - [Docker 17.06.0-ce](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce)
  - [Docker Credential Helpers 0.5.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.2)
  - [Docker Machine 0.12.0](https://github.com/docker/machine/releases/tag/v0.12.0)
  - [Docker compose 1.14.0](https://github.com/docker/compose/releases/tag/1.14.0)
  - qcow-tool v0.10.0 (improve the performance of `compact`: mirage/ocaml-qcow#94)
  - OSX Yosemite 10.10 is marked as deprecated
  - Linux Kernel 4.9.31

* New
  - Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories.
  - GUI Option to opt-out of credential store
  - GUI option to reset docker data without loosing all settings (fixes docker/for-mac#1309)
  - Add an experimental DNS name for the host: docker.for.mac.localhost
  - Support for client (i.e. "login") certificates for authenticating registry access (fixes docker/for-mac#1320)
  - Osxfs: support for `cached` mount flag to improve performance of macOS mounts when strict consistency is not necessary

* Bug fixes and minor changes
  - Resync HTTP(S) proxy settings on application start
  - Interpret system proxy setting of localhost correctly (see [docker/for-mac#1511])
  - All docker binaries bundled with Docker for Mac are now signed
  - Display all docker cloud organizations & repositories in the whale menu (fixes docker/for-mac#1538)
  - Osxfs: improved latency for many common operations (e.g. read and write) by ~25%
  - Fix GUI crash when text table view was selected and windows re-opened (fixes https://github.com/docker/for-mac/issues/1477)
  - Reset to default / uninstall also remove config.json and osxkeychain credentials
  - More detailed virtualbox uninstall requirements (cf https://github.com/docker/for-mac/issues/1343)
  - Request time sync after waking up to improve https://github.com/docker/for-mac/issues/17
  - VPNKit: Improve DNS timeout handling (fixes https://github.com/docker/vpnkit/issues/202)
  - VPNKit: Use DNSServiceRef API by default (only enabled for new installs or after factory reset)
  - Add a reset to factory defaults button when application crashes
  - Toolbox import dialog now defaults to "Skip"
  - Buffered data should be treated correctly when docker client requests are upgraded to raw streams
  - Removed an error message from the output related to experimental features handling
  - Vmnetd should not crash when user home directory is on an external drive
  - Improved settings database schema handling
  - Disk trimming should work as expected
  - Diagnostics now contains more settings data

### 2017-05-12 17.03.1-ce-mac12

* Hotfixes
    - Fixes security issue CVE-2017-7308

### 2017-04-29 17.03.1-ce-mac5

* Upgrades
    - [Docker 17.03.1-ce](https://github.com/docker/docker/releases/tag/v17.03.1-ce)
    - [Docker Credential Helpers 0.5.0](https://github.com/docker/docker-credential-helpers/releases/tag/v0.5.0)
    - Linux kernel 4.9.13

### 2017-03-06 17.03.0-ce-mac2

* Hotfixes
  - Set the ethernet MTU to 1500 to prevent a hyperkit crash (docker/for-mac#1228)
  - Fix docker build on private images (docker/docker#31534)

* New
    - Renamed to Docker Community Edition
    - Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories. This feature is going to be rolled out to all users progressively
    - Docker will now securely store your IDs in the macOS keychain

* Upgrades
    - [Docker 17.03.0-ce](https://github.com/docker/docker/releases/tag/v17.03.0-ce)
    - [Docker Compose 1.11.2](https://github.com/docker/compose/releases/tag/1.11.2)
    - [Docker Machine 0.10.0](https://github.com/docker/machine/releases/tag/v0.10.0)
    - [Docker Credential Helpers 0.4.2](https://github.com/docker/docker-credential-helpers/releases/tag/v0.4.2)
    - Linux kernel 4.9.11

* Bug fixes and minor changes
    - Allow to reset faulty daemon.json through a link in advanced subpanel
    - More options when moving disk image
    - Add link to experimental features
    - Filesharing and daemon table empty fields are editable
    - Hide restart button in settings window
    - Fix bug where update window hides when app not focused
    - Don't use port 4222 inside the Linux VM
    - Add page_poison=1 to boot args
    - Add a new disk flushing option
    - DNS forwarder ignores responses from malfunctioning servers (docker/for-mac#1025)
    - DNS forwarder send all queries in parallel, process results in order
    - DNS forwarder includes servers with zones in general searches (docker/for-mac#997)
    - Parses aliases from /etc/hosts (docker/for-mac#983)
    - Can resolve DNS requests via servers listed in the /etc/resolver directory on the host
    - Limit vCPUs to 64
    - Fix for swap not being mounted
    - Fix aufs xattr delete issue (docker/docker#30245)
    - osxfs: catch EPERM when reading extended attributes of non-files
    - VPNKit: fix unmarshalling of DNS packets containing pointers to pointers to labels
    - VPNKit: set the Recursion Available bit on DNS responses from the cache
    - VPNKit: Avoid diagnostics to capture too much data
    - VPNKit: Fix a source of occasional packet loss (truncation) on the virtual ethernet link
    - HyperKit: Dump guest physical and linear address from VMCS when dumping state
    - HyperKit: Kernel boots with panic=1 arg

### 2017-03-02 17.03.0-ce-mac1

* New
    - Renamed to Docker Community Edition
    - Integration with Docker Cloud: control remote Swarms from the local CLI and view your repositories. This feature is going to be rolled out to all users progressively
    - Docker will now securely store your IDs in the macOS keychain

* Upgrades
    - [Docker 17.03.0-ce](https://github.com/docker/docker/releases/tag/v17.03.0-ce)
    - [Docker Compose 1.11.2](https://github.com/docker/compose/releases/tag/1.11.2)
    - [Docker Machine 0.10.0](https://github.com/docker/machine/releases/tag/v0.10.0)
    - Linux kernel 4.9.11

* Bug fixes and minor changes
    - Allow to reset faulty daemon.json through a link in advanced subpanel
    - More options when moving disk image
    - Add link to experimental features
    - Filesharing and daemon table empty fields are editable
    - Hide restart button in settings window
    - Fix bug where update window hides when app not focused
    - Don't use port 4222 inside the Linux VM
    - Add page_poison=1 to boot args
    - Add a new disk flushing option
    - DNS forwarder ignores responses from malfunctioning servers (docker/for-mac#1025)
    - DNS forwarder send all queries in parallel, process results in order
    - DNS forwarder includes servers with zones in general searches (docker/for-mac#997)
    - Parses aliases from /etc/hosts (docker/for-mac#983)
    - Can resolve DNS requests via servers listed in the /etc/resolver directory on the host
    - Limit vCPUs to 64
    - Fix for swap not being mounted
    - Fix aufs xattr delete issue (docker/docker#30245)
    - osxfs: catch EPERM when reading extended attributes of non-files
    - VPNKit: fix unmarshalling of DNS packets containing pointers to pointers to labels
    - VPNKit: set the Recursion Available bit on DNS responses from the cache
    - VPNKit: Avoid diagnostics to capture too much data
    - VPNKit: Fix a source of occasional packet loss (truncation) on the virtual ethernet link
    - HyperKit: Dump guest physical and linear address from VMCS when dumping state
    - HyperKit: Kernel boots with panic=1 arg

### 2017-01-20 1.13.0-beta38

* Upgrades
    - [Docker 1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)
    - [Docker Compose 1.10](https://github.com/docker/compose/releases/tag/1.10.0)
    - [Docker Machine 0.9.0](https://github.com/docker/machine/releases/tag/v0.9.0)
    - [Notary 0.4.3](https://github.com/docker/notary/releases/tag/v0.4.3)
    - Linux kernel 4.9.4
    - qcow-tool 0.7.2

* New
    - The storage location of the Linux volume can now be moved
    - Reclaim disk size on reboot
    - You can now edit filesharing paths
    - Memory can be allocated with 256 MiB steps
    - Proxy can now be completely disabled
    - Support for arm, aarch64, ppc64le architectures using qemu
    - Dedicated preference pane for advanced configuration of the docker daemon (edit daemon.json)
    - Docker Experimental mode can be toggled
    - Better support for Split DNS VPN configurations
    - Use more DNS servers, respect order

* Bug fixes and minor changes
    - You can't edit settings while docker is restarting
    - Support Copy/Paste in About box
    - Auto update polling every 24h
    - Kernel boots with vsyscall=emulate arg and CONFIG_LEGACY_VSYSCALL is set to NONE in Moby
    - Fix vsock deadlock under heavy write load (#6139)
    - If you opt-out of analytics, you're prompted for approval before a bug report is sent (#6134)
    - Fix bug where search domain could be read as `DomainName`
    - Dedicated preference pane for HTTP proxy settings. (#6013)
    - Dedicated preference pane for CPU & Memory computing resources. (#6013)
    - Privacy settings moved to the general preference pane. (#6013)
    - Fixed an issue where the preference pane disappeared when the welcome whale menu was closed. (#6013)
    - HyperKit: code cleanup and minor fixes (#5688)
    - Improvements to Logging and Diagnostics
    - osxfs: switch to libev/kqueue to improve latency (#5629)
    - VPNKit: improvements to DNS handling (#5750)
    - VPNKit: Improved diagnostics (#6080, #6104)
    - VPNKit: Forwarded UDP datagrams should have correct source port numbers (#5926)
    - VPNKit: add a local cache of DNS responses
    - VPNKit: If one request fails, allow other concurrent requests to succeed.
      For example this allows IPv4 servers to work even if IPv6 is broken. (#5926)
    - VPNKit: Fix bug which could cause the connection tracking to
      underestimate the number of active connections (#5926)

### 2017-01-16 1.13.0-rc7-beta37

* Upgrades
    - Docker 1.13.0-rc7
    - Notary 0.4.3
    - Linux kernel 4.9.3

### 2017-01-12 1.13.0-rc6-beta36

NOTE: Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.

* Upgrades
    - Docker 1.13.0-rc6
    - Docker Compose 1.10-rc2

* Bug fixes
    - Revert to Linux 4.4.41 LTS kernel to resolve fuse cache issues


### 2017-01-06 1.13.0-rc5-beta35

NOTE: Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.

* Upgrades
    - Docker 1.13.0-rc5
    - Docker Compose 1.10-rc1


### 2016-12-22 1.13.0-rc4-beta34.1

NOTE: Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.

* Hotfixes
    - Fix issue where Docker would fail to start after importing containers from toolbox

* New
    - Change UI for path location and open finder
    - Trim compact on reboot
    - Use more DNS servers, respect order

* Upgrades
    - qcow-tool 0.7.2
    - Docker 1.13.0-rc4
    - Linux Kernel 4.8.15

* Bug fixes and minor changes
    - New Daemon icon
    - Support Copy/Paste in About box
    - Fix advanced daemon check json changes
    - Auto update polling every 24h


### 2016-12-20 1.13.0-rc4-beta34

NOTE: Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.

* New
    - Change UI for path location and open finder
    - Trim compact on reboot
    - Use more DNS servers, respect order

* Upgrades
    - Docker 1.13.0-rc4
    - Linux Kernel 4.8.15

* Bug fixes and minor changes
    - New Daemon icon
    - Support Copy/Paste in About box
    - Fix advanced daemon check json changes
    - Auto update polling every 24h

### 2016-12-16 1.13.0-rc3-beta33

NOTE: Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.

* New
    - You can now edit filesharing paths
    - Memory can be allocated with 256 MiB steps
    - The storage location of the Linux volume can now be moved
    - More explicit proxy settings
    - Proxy can now be completly disabled
    - You can switch daemon tabs without losing your settings
    - You can't edit settings while docker is restarting

* Upgrades
    - Linux Kernel 4.8.14

* Bug fixes and minor changes
    - Kernel boots with vsyscall=emulate arg and CONFIG_LEGACY_VSYSCALL is set to NONE in Moby

### 2016-12-07 1.13.0-rc3-beta32

NOTE: Plugins installed using the experimental "managed plugins" feature in Docker 1.12 must be removed/uninstalled before upgrading.

* New
    - Support for arm, aarch64, ppc64le architectures using qemu

* Upgrades
    - Docker 1.13.0-rc3
    - Docker Machine 0.9.0-rc2
    - Linux Kernel 4.8.12

* Bug fixes and minor changes
    - VPNKit: Improved diagnostics (#6080, #6104)
    - Fix vsock deadlock under heavy write load (#6139)
    - On the beta channel you can't opt-out of analytics (#6134)
    - If you opt-out of analytics, you're prompted for approval before a bug report is sent (#6134)

### 2016-11-30 1.13.0-rc2-beta31

* Upgrades
    - Docker 1.13.0-rc2
    - Docker Compose 1.9.0
    - Docker Machine 0.9.0-rc1
    - Linux kernel 4.8.10

* New
    - Dedicated preference pane for advanced configuration of the docker daemon (edit daemon.json). (#5895, #5974)
    - Docker Experimental mode can be toggled. (#6001, #6044)

* Bug fixes and minor improvements
    - Fix bug where search domain could be read as `DomainName`
    - VPNKit: don't permute resource records in responses
    - VPNKit: reduce the amount of log spam
    - Dedicated preference pane for HTTP proxy settings. (#6013)
    - Dedicated preference pane for CPU & Memory computing resources. (#6013)
    - Privacy settings moved to the general preference pane. (#6013)
    - Fixed an issue where proxy settings were erased if registries or mirrors changed. (#5970)
    - Tab key is now cycling through tabs while setting proxy parameters. (#5977)
    - Fixed an issue where the preference pane disappeared when the welcome whale menu was closed. (#6013)

### 2016-11-16 1.12.3-beta30.1

* Bug fixes and minor improvements
    - VPNKit: Forwarded UDP datagrams should have correct source port numbers (#5926)
    - VPNKit: DNS responses from the cache should have the response bit set (#5926)
    - VPNKit: Fix bug where the wrong DNS response could be cached (#5926)
    - VPNKit: If one request fails, allow other concurrent requests to succeed.
      For example this allows IPv4 servers to work even if IPv6 is broken. (#5926)
    - VPNKit: Fix bug which could cause the connection tracking to
      underestimate the number of active connections (#5926)
    - Moby: Fix fsck bug that would recreate the disk image even when it was
      able to recover (#5927)

### 2016-11-10 1.12.3-beta30

* New
    - Better support for Split DNS VPN configurations

* Upgrades
    - Docker Compose 1.9.0-rc4
    - Linux kernel 4.4.30

* Bug fixes and minor changes
    - HyperKit: code cleanup and minor fixes (#5688)
    - VPNKit: improvements to DNS handling (#5750)
    - Improvements to Logging and Diagnostics
    - osxfs: switch to libev/kqueue to improve latency (#5629)

### 2016-11-02 1.12.3-beta29.3

* Upgrades
    - Docker Compose 1.9.0-rc2

* Hotfixes
    - osxfs: fix a simultaneous volume mount race which can result in a crash

### 2016-10-27 1.12.3-beta29.2

* Hotfixes
    - Upgrade to docker 1.12.3

### 2016-10-26 1.12.3-rc1-beta29.1

* Hotfixes
    - Fix missing /dev/pty/ptmx (docker/docker#27765)

### 2016-10-25 1.12.3-rc1-beta29

* New
    - Overlay2 is now the default storage driver. You must do a factory reset
      for overlay2 to be automatically used. (#5545)

* Upgrades
    - Docker 1.12.3-rc1
    - Linux kernel 4.4.27

* Bug fixes and minor changes
    - Fix an issue where the whale animation during setting change was
      inconsistent (#5585)
    - Fix an issue where some windows stayed hidden behind another app (#5655)
    - Fix application of system or custom proxy settings over container
      restart (#5625)
    - Increase default ulimit for memlock (fixes
      https://github.com/docker/for-mac/issues/801 )
    - Fix an issue where the Docker status would continue to be
      yellow/animated after the VM had started correctly
    - osxfs: fix the prohibition of chown on read-only or mode 0 files (#4738)
      (fixes https://github.com/docker/for-mac/issues/117
       https://github.com/docker/for-mac/issues/263
       https://github.com/docker/for-mac/issues/633 )

### 2016-10-13 1.12.2-beta28

* Upgrades
    - Docker 1.12.2
    - Kernel 4.4.24
    - Notary 0.4.2

* Bug fixes and minor changes
    - Fix an issue where Docker for Mac was incorrectly reported as updated (#5473)
    - osxfs: fix race causing some reads to run forever (#5367)
    - Channel is now displayed in about box (#5478)
    - Crash reports are sent over Bugsnag rather than HockeyApp (#5434, #5405, #5406)

### 2016-09-28 1.12.2-rc1-beta27

* Upgrades
    - Docker 1.12.2-rc1
    - Docker Machine 0.8.2
    - Docker compose 1.8.1
    - Kernel vsock driver v7
    - Kernel 4.4.21
    - aufs 20160912

* Bug fixes and minor changes
    - Fix an issue where some windows did not claim focus correctly (#5221,#5314)
    - Add UI when switching channel to prevent user losing containers and settings (#5253)
    - Check disk capacity before toolbox import (#5165)
    - Import certificates in etc/ssl/certs/ca-certificates.crt (#5239)
    - DNS: reduce the number of UDP sockets consumed on the host
    - VPNkit: improve the connection-limiting code to avoid running out of sockets on the host
    - UDP: handle diagrams bigger than 2035, up to the configured macOS kernel limit
    - UDP: make the forwarding more robust; drop packets and continue rather than stopping
    - disk: make the "flush" behaviour configurable for database-like workloads. This works around a performance regression in 1.12.1.

### 2016-08-31 1.12.1-beta26.1

* Hotfixes
    - Re-enable experimental mode for docker client (#5198)

### 2016-09-14 1.12.1-beta26

* New
    - Improved support for macOS 10.12 Sierra

* Upgrades
    - Linux kernel 4.4.20
    - aufs 20160905

* Bug fixes and minor changes
    - Fix communications glitch when UI talks to com.docker.vmnetd (#5115)
      Fixes https://github.com/docker/for-mac/issues/90
    - UI fix for macOs 10.12 (#5152)
    - Windows open on top of full screen app are available in all spaces (#5136)
    - Reporting a bug, while not previously logged into github now works. (#5110)
    - When a diagnostic upload fails, the error is properly reported (#5116)
    - docker-diagnose: display and record the time the diagnosis was captured (#5075)
    - Allow ports to be bound on host addresses other than 0.0.0.0 and 127.0.0.1 (moby/#482)
      Fixes issue reported in https://github.com/docker/for-mac/issues/68
    - Don't compute the container folder in com.docker.vmnetd (#5066)
      Fixes https://github.com/docker/for-mac/issues/47

* Known issues
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart
      Docker.app (#1224)
    - There are a number of issues with the performance of
      directories bind-mounted with `osxfs`. In particular, writes of
      small blocks and traversals of large directories are currently
      slow. Additionally, containers that perform large numbers of
      directory operations, such as repeated scans of large directory
      trees, may suffer from poor performance. More information is
      available in the Known Issues section of the documentation at
      https://docs.docker.com/docker-for-mac/troubleshoot/#known-issues
    - Under some unhandled error conditions, inotify event delivery can
      fail and become permanently disabled.
      The workaround is to restart Docker.app (#2181)

### 2016-09-07 1.12.1-beta25

* Upgrades
    - Experimental support for OSX 10.12 Sierra (beta)

* Bug fixes and minor changes
    - VPNKit supports search domains (#4974)
    - Entries from /etc/hosts should now resolve from within containers
    - osxfs: fix thread leak (#4933)

* Known issues
    - Several problems have been reported on macOS 10.12 Sierra and are being
      investigated. This includes failure to launch the app and being unable
      to upgrade to a new version.
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart
      Docker.app (#1224)
    - There are a number of issues with the performance of
      directories bind-mounted with `osxfs`. In particular, writes of
      small blocks and traversals of large directories are currently
      slow. Additionally, containers that perform large numbers of
      directory operations, such as repeated scans of large directory
      trees, may suffer from poor performance. More information is
      available in the Known Issues section of the documentation at
      https://docs.docker.com/docker-for-mac/troubleshoot/#known-issues
    - Under some unhandled error conditions, inotify event delivery can
      fail and become permanently disabled.
      The workaround is to restart Docker.app (#2181)

### 2016-08-31 1.12.1-beta24.1

* Hotfixes
    - Fix regression in UI when changing memory/cpu settings

### 2016-08-30 1.12.1-beta24

* Upgrades
    - Docker 1.12.1
    - Docker machine 0.8.1
    - Linux kernel 4.4.19
    - aufs 20160822

* Bug fixes and minor changes
    - osxfs: fixed a malfunction of new directories that have the same
      name as an old directory that is still open (#4532)
    - osxfs: rename events now trigger DELETE and/or MODIFY inotify
      events (saving with TextEdit works now) (#4498)
    - slirp: support up to 8 external DNS servers
    - slirp: reduce the number of sockets used by UDP NAT, reduce the
      probability that NAT rules will time out earlier than expected (#4826)
    - Warn the user if BlueStacks is installed (potential kernel panic) (#4661)

* Known issues
    - Several problems have been reported on macOS 10.12 Sierra and are being
      investigated. This includes failure to launch the app and being unable
      to upgrade to a new version.
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart
      Docker.app (#1224)
    - There are a number of issues with the performance of
      directories bind-mounted with `osxfs`. In particular, writes of
      small blocks and traversals of large directories are currently
      slow. Additionally, containers that perform large numbers of
      directory operations, such as repeated scans of large directory
      trees, may suffer from poor performance. More information is
      available in the Known Issues section of the documentation at
      https://docs.docker.com/docker-for-mac/troubleshoot/#known-issues
    - Under some unhandled error conditions, inotify event delivery can
      fail and become permanently disabled.
      The workaround is to restart Docker.app (#2181)

### 2016-08-16 1.12.1-rc1-beta23

* Upgrades
    - Docker 1.12.1-rc1
    - Linux kernel 4.4.17
    - aufs 20160808

* Bug fixes and minor changes
    - Automatic update interval changed from 1 hour to 24 hours (#4822)
    - Moby: use default sysfs settings, transparent huge pages disabled (#4815)
    - Moby: cgroup mount to support systemd in containers (#4789)
    - osxfs: fix an issue that caused inotify failure and crashes (#4799)
    - osxfs: fix a directory fd leak (#4533)
    - Zsh completions (#4785)

* Known issues
    - Several problems have been reported on macOS 10.12 Sierra and are being
      investigated. This includes failure to launch the app and being unable
      to upgrade to a new version.
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart Docker.app (#1224)
    - There are a number of issues with the performance of
      directories bind-mounted with `osxfs`. In particular, writes of
      small blocks and traversals of large directories are currently
      slow. Additionally, containers that perform large numbers of
      directory operations, such as repeated scans of large directory
      trees, may suffer from poor performance. More information is
      available in the Known Issues section of the documentation at
      https://docs.docker.com/docker-for-mac/troubleshoot/#known-issues
    - Under some unhandled error conditions, inotify event delivery can
      fail and become permanently disabled.
      The workaround is to restart Docker.app (#2181)

### 2015-08-11 1.12.0-beta22

* New

* Upgrades
    - Linux kernel to 4.4.16

* Bug fixes and minor changes
    - Increase Moby fs.file-max to 524288
    - Increase Moby fs.file-max to 524288
    - Use Mac System Configuration database to detect DNS (#4649)
    - HyperKit updated with dtrace support and lock fixes
    - Fix Moby Diagnostics and Update Kernel (#4636)
    - UI Fixes (#4538)
    - osxfs: fix socket chowns (#4743)

* Known issues
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart Docker.app (#1224)
    - There are a number of issues with the performance of
      directories bind-mounted with `osxfs`. In particular, writes of
      small blocks and traversals of large directories are currently
      slow. Additionally, containers that perform large numbers of
      directory operations, such as repeated scans of large directory
      trees, may suffer from poor performance. More information is
      available in the Known Issues section of the documentation at
      https://docs.docker.com/docker-for-mac/troubleshoot/#known-issues

    - Under some unhandled error conditions, inotify event delivery can
      fail and become permanently disabled.
      The workaround is to restart Docker.app (#2181)

### 2016-08-03 1.12.0-beta21.1

* Hotfixes
    - osxfs: fixed an issue causing access to children of renamed
      directories to fail (symptoms: npm failures, apt-get failures)
      (docker/for-mac#53 #74 #76)
    - osxfs: fixed an issue causing some ATTRIB and CREATE inotify
      events to fail delivery and other inotify events to stop (#4650 #4652)
    - osxfs: fixed an issue causing all inotify events to stop when an
      ancestor directory of a mounted directory was mounted (#4635)
    - osxfs: fixed an issue causing volumes mounted under other mounts
      to spontaneously unmount (docker/docker#24503)

### 2016-07-28 1.12.0-beta21

* New
    - Docker for Mac is now available from 2 channels - stable and beta.
      New features and bug fixes will go out first in auto-updates to users
      in the beta channel. Updates to the stable channel are much less
      frequent and happen in sync with major and minor releases of the Docker
      engine. Only features that are well-tested and ready for production are
      added to the stable channel releases. You can download Docker for Mac
      stable at https://download.docker.com/mac/stable/Docker.dmg

* Upgrades
    - docker 1.12.0 with experimental features
    - docker machine 0.8.0
    - docker compose 1.8.0

* Bug fixes and minor changes
    - Check for updates, auto-update and diagnose can be run by non-admin users (#4441)
    - osxfs: fixed an issue causing occasional incorrect short reads (#3876)
    - osxfs: fixed an issue causing occasional EIO errors (#3876)
    - osxfs: fixed an issue causing inotify creation events to fail (#3876)
    - osxfs: increased the fs.inotify.max_user_watches limit in Moby to 524288
    - The UI shows documentation link for sharing volumes (#4482)
    - Improved error when running with outdated Virtualbox version (#4450)
    - Added link to sources for qemu-img (#4503)

* Known issues
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart Docker.app (#1224)
    - There are a number of issues with the performance of
      directories bind-mounted with `osxfs`. In particular, writes of
      small blocks and traversals of large directories are currently
      slow. Additionally, containers that perform large numbers of
      directory operations, such as repeated scans of large directory
      trees, may suffer from poor performance. More information is
      available in the Known Issues section of the documentation at
      https://docs.docker.com/docker-for-mac/troubleshoot/#known-issues

    - Under some unhandled error conditions, inotify event delivery can
      fail and become permanently disabled.
      The workaround is to restart Docker.app (#2181)

### 2016-07-19 1.12.0-rc4-beta20

* New

* Upgrades

* Bug fixes and minor changes
    - Fix docker.sock permission issues (#3919)
    - Don't check for update when the settings panel opens (#4431)
    - Remove obsolete DNS workaround (#4432)
    - Use the secondary DNS server in more circumstances (#4429)
    - Limit the number of concurrent port forwards to avoid running out of resources (#4429)
    - Store the database as a "bare" git repo to avoid corruption problems (#4236)

* Known issues
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart Docker.app (#1224)

### 2016-07-14 1.12.0-rc4-beta19

* New
    - Add privacy tab in settings (#4190)
    - Allow the definition of HTTP proxy overrides in the UI (#3517, #4303)

* Upgrades
    - Docker 1.12.0 RC4
    - Docker Compose 1.8.0 RC2
    - Docker Machine 0.8.0 RC2
    - Linux kernel 4.4.15

* Bug fixes and minor changes
    - filesystem sharing permissions can only be configured in the UI (no more `/Mac` in moby) (#4312)
    - com.docker.osx.xhyve.hyperkit: increase max number of fds to 10240 (#4232)
    - Improve Moby syslog facilities (#4261)
    - Improve file-sharing tab (#4252)
    - com.docker.slirp: include the DNS TCP fallback fix, required when UDP responses are truncated (docker/vpnkit#72)
    - docker build/events/logs/stats... won't leak when iterrupted with Ctrl-C (#3628)

### 2016-07-07 1.12.0-rc3-beta18.1

NOTE: Docker 1.12.0 RC3 release introduces a backward incompatible change from RC2,
See https://github.com/docker/docker/issues/24343#issuecomment-230623542 for more details.

Fix for the above can be found at: https://docs.docker.com/docker-for-mac/troubleshoot/#/recreate-or-update-your-containers-after-beta-18-upgrade

* Hotfix
    - Fix issue resulting in error "Hijack is incompatible with use of CloseNotifier", reverts previous fix for "Ctrl-C" during build.

* New
    - New host/container file sharing UI (#4193, #4191)
    - /Mac bind mount prefix is deprecated and will be removed soon

* Upgrades
    - Docker 1.12.0 RC3 (#4199, #4177)

* Bug fixes and minor changes
    - VPNKit: Improved scalability as number of network connections increases (#4173)
    - The docker API proxy was failing to deal with some 1.12 features (e.g. health check)

* Known issues
    - See https://docs.docker.com/docker-for-mac/troubleshoot/

### 2016-07-06 1.12.0-rc3-beta18

* New
    - New host/container file sharing UI (#4193, #4191)
    - /Mac bind mount prefix is deprecated and will be removed soon

* Upgrades
    - Docker 1.12.0 RC3 (#4199, #4177)

* Bug fixes and minor changes
    - VPNKit: Improved scalability as number of network connections increases (#4173)
    - Interrupting a `docker build` with Ctrl-C will actually stop the build
    - The docker API proxy was failing to deal with some 1.12 features (e.g. health check)

* Known issues
    - See https://docs.docker.com/docker-for-mac/troubleshoot/

### 2016-06-29 1.12.0-rc2-beta17

* Upgrades
    - Linux kernel 4.4.14, aufs 20160627 (#4133)

* Bug fixes and minor changes
    - Documentation moved to https://docs.docker.com/docker-for-mac/
    - Allow non-admin users to launch the app for the first time (using admin creds) (#4060)
    - Prompt non-admin users for admin password when needed in Settings (#4046)
    - Fixed download links, documentation links (#4059, #4013)
    - Fixed "failure: No error" message in diagnostic panel (#4010)
    - Improved diagnostics for networking and logs for the service port openers (#4116)

* Known issues
    - See https://docs.docker.com/docker-for-mac/troubleshoot/

### 2016-06-17 1.12.0-rc2-beta16

* New
    - Docs have been updated! See https://beta.docker.com/docs/

* Upgrades
    - Docker 1.12.0 RC2
    - docker-compose 1.8.0 RC1
    - docker-machine 0.8.0 RC1
    - notary 0.3
    - Alpine 3.4

* Bug fixes and minor changes
    - VPNKit: fix a regressed error message when a port is in use (#3904)
    - Fix UI crashing with 'NSInternalInconsistencyException' / fd leak (#3883)
    - HyperKit API: Improved error reporting (#3888)
    - osxfs: fix sporadic EBADF due to fd access/release races (#3683)

* Known issues
    - See https://beta.docker.com/docs/mac/troubleshoot/#known-issues

### 2016-06-10 1.11.2-beta15

* New
    - Docs have been updated! See https://beta.docker.com/docs/
    - Registry mirror and insecure registries can now be configure from Settings
    - VM can now be restarted from Settings
    - sysctl.conf can be edited from Settings

* Upgrades
    - Docker 1.11.2
    - Linux 4.4.12, aufs 20160530

* Bug fixes and minor changes
    - Number of concurrent TCP/UDP connections increased in VPNKit
    - Hyperkit: vsock stability improvements
    - Fixed crash when admin user group does not exit

* Known issues
    - See https://beta.docker.com/docs/mac/troubleshoot/#known-issues

### 2016-06-06 1.11.1-beta14.1

* Hotfix
    - Updated Linux kernel to avoid falsely triggering an alarm in a common antivirus scanner

### 2016-06-06 1.11.1-beta14

* New
    - Docs have been updated! See https://beta.docker.com/docs/
    - New menu item "Diagnose & Feedback" can now be used to run diagnostics and upload logs to Docker

* Known issues
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart Docker.app (#1224)

* Bug fixes and minor changes
    - osxfs: support statfs (#3536)
    - settings: updated toolbar icons (#3476)
    - Fall back to secondary DNS server if primary fails (#3458)
    - Link to documentation from menu

### 2016-05-28 1.11.1-beta13.1

* Hotfixes
    – osxfs: Fix sporadic EBADF errors and End_of_file crashes due to a race corrupting node table invariants (#3454)
    – osxfs: Fix a crash after accessing a sibling of a file moved to another directory caused by a node table invariant violation (#3474)
    – Proxy settings were applied on network change, causing docker daemon to restart too often
    – Log file sizes doubled on docker daemon restart

### 2016-05-25 1.11.1-beta13

* New
    - osxfs: enabled 10ms dcache for 3x speedup on a go list ./... test against docker/machine. Workloads
      heavy in file system path resolution (common among dynamic languages and build systems) will have
      those resolutions performed in amortized constant time rather than time linear in the depth of the
      path so speedups of 2-10x will be common
    - Support multiple users on the same machine, non-admin users can use the app as long as vmnetd has been installed. Currently
      only one user can be logged in at the same time.
    - Basic support for using system HTTP/HTTPS proxy in docker daemon
    - Docs have been updated! See https://beta.docker.com/docs/

* Known issues
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart
      Docker.app (#1224)

* Bug fixes and minor changes
    - osxfs: setting atime and mtime of nodes is now supported (#2174)
    - osxfs: fixed major regression in Beta 12 with ENOENT, ENOTEMPY, and other spurious errors after
      a directory rename. This manifested as `npm install` failure and other directory traversal issues. (#3229)
    - osxfs: fixed temporary file ENOENT errors (#3220, #1794)
    - osxfs: fixed in-place editing file truncation error (e.g. perl -i) (#3219)
    - improve time synchronisation after sleep (#3240)

### 2016-05-17 1.11.1-beta12

* New
    - Docs have been updated! See https://beta.docker.com/docs/

* Known issues
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart
      Docker.app (#1224)

* Bug fixes and minor changes
    - UI improvements (#3138, #3107)
    - osxfs: fixed mkdir returns EBUSY but directory is created (#3131)
    - osxfs: FUSE 7.23 (#3130)

### 2016-05-10 1.11.1-beta11

* New
    - osxfs now persists ownership changes in an extended attribute, see
      https://beta.docker.com/docs/mac/osxfs/ (#823)

* Upgrades
    - docker-compose 1.7.1
    - Kernel 4.4.9

* Bug fixes and minor changes
    - desktop notifications after successful update (#2947)
    - no "update available" popup during install process (#2973)
    - fix repeated bind of privileged ports (#3015)
    - osxfs: fix the block count reported by stat (#2978)
    - Moby: Fix vsock half closed issue (#2961)
    - Moby: Add NFS support (#2961)
    - Moby: Hostname is now Moby, not Docker (#2961)
    - Moby: Fixes to disk formatting scripts (#2961)

### 2016-05-03 1.11.1-beta10

* New
    - Token validation is now done over an actual SSL tunnel (HTTPS).
      (should fix issues with antivirus software)
    - Docs have been updated! See https://beta.docker.com/docs/

* Upgrades
    - docker 1.11.1 (#2858, 2808)

* Bug fixes and minor changes
    - UCP now starts again (#2854)
    - include debugging symbols in xhyve (#2837)
    - vsock stability improvements (#2831)
    - addressing glitches in Settings panel
    - fix issues impacting the "whale menu"
    - fix uninstall process
    - xhyve vcpu state machine improvements, may improve suspend/resume (#2798)

### 2016-04-28 1.11.0-beta9

* New
    - `localhost` is now used for port forwarding by default.
      `docker.local` will no longer work as of Beta 9. See documentation
      for details.
    - Docs have been updated! See https://beta.docker.com/docs/
    - New settings window - memory and vCPUs now adjustable (#2634)

* Known issues
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart
      Docker.app (#1224)

* Bug fixes and minor changes
    - Fix loopback device naming (#2734)
    - Improve docker socket download and osxfs sequential write by ~20% (#2653)
    - osxfs: improve sequential read throughput by up to 20% (#2654)
    - osxfs: improve readdir performance by up to 6x (#2695)
    - osxfs: log all fatal exceptions (#2732)
    - more reliable DNS forwarding over UDP and TCP (#2721, #2786)
    - UDP ports can be proxied over vsock (#2711)
    - fix EADDRINUSE (manifesting as errno 526) when ports are re-used (#2818)
    - send ICMP when asked to not fragment and we can't guarantee it (#2780)
    - fix parsing of UDP datagrams with IP socket options (#2780)
    - drop abnormally large ethernet frames (#2793)
    - Improve xhyve logging (#2719)
    - Record VM start and stop events (#2698)

### 2016-04-19 1.11.0-beta8

* New
    - Docs have been updated! See https://beta.docker.com/docs/
    - Networking mode switched to VPN compatible by default (#2091),
      and as part of this change the overall experience has been improved:
	- `docker.local` now works in VPN compatibility mode (#2603)
	- exposing ports on the Mac is available in both networking modes (#2621)
	- port forwarding of privileged ports now works in both networking modes (#2557)
	- traffic to external DNS servers is no longer dropped in VPN mode (#2625)
    - `osxfs` now uses `AF_VSOCK` for transport (#2531, #2584) giving ~1.8x
    speedup for large sequential read/write workloads but increasing
    latency by ~1.3x. `osxfs` performance engineering work continues.

* Known issues
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart
      Docker.app (#1224)

* Bug fixes and minor changes
    - Apple System Log now used for most logs instead of direct filesystem logging (#2543, #2587)
    - docker_proxy fixes (#2539)
    - Merge Xhyve upstream patches (#2551)
    - Improve error reporting in `nat` network mode (#2606)
    - `osxfs` `transfused` client now logs over `AF_VSOCK` (#2602)
    - Fixed a com.docker.osx.xhyve.linux supervisor deadlock if processes exit
      during a controlled shutdown (#2602)
    - Fixed VPN mode malformed DNS query bug preventing some resolutions (#2607)

### 2016-04-14 1.11.0-beta7

* New
    - Docs have been updated! See https://beta.docker.com/docs/
    - Use `AF_VSOCK` for Docker socket transport (#2469, #2438, #2410)

* Upgrades
    - docker 1.11.0
    - docker-machine 0.7.0
    - docker-compose 1.7.0

* Known issues
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart
      Docker.app (#1224)
    - If VPN mode is enabled and then disabled and then re-enabled again,
      `docker ps` will block for 90s (#2337)

* Bug fixes and minor changes
    - Logging improvements (#2455, #2427, #2409, #2380, #2379)
    - Improve process management (#2454, #2451, #2456)

### 2016-04-05 1.11.0-beta6

* New
    - Docs have been updated! See https://beta.docker.com/docs/
    - Add uninstall option in user interface (#2198)

* Upgrades
    - docker 1.11.0-rc3 (#2255)
    - docker-compose 1.7.0-rc2 (#2301)
    - docker-machine 0.7.0-rc1
    - Linux 4.4.6

* Known issues
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart
      Docker.app (#1224)
    - If VPN mode is enabled and then disabled and then re-enabled again,
      `docker ps` will block for 90s (#2337)

* Bug fixes and minor changes
    - Fix osxfs multiple same directory bind mounts stopping inotify (#2258)
    - Fix osxfs setattr on mode 0 files (sed failures) (#2171)
    - Fix osxfs blocking all operations during `readdir` (#2141)
    - Fix osxfs mishandled errors which crashed the file system and VM (#2166)
    - Remove outdated lofs/9p support (#2256)
    - Add more debugging info to logs uploaded by `pinata diagnose` (#2175)
    - Improve diagnostics from within VM (#2183)
    - Virtualbox version check now also works without VBoxManage in path (#2152)
    - VPN mode now uses same IP range as NAT mode (#2151)
    - Tokens are now verified on port 443 (#2117)
    - Remove outdated uninstall scripts  (#2198)
    - Increase default ulimits (#2253)
    - Port forwarding with `-p` and `-P` should work in VPN mode (#2190)
    - Fix a memory leak in com.docker.db (#2289)
    - Fix a race on startup between docker and networking which can
      lead to Docker.app not starting on reboot (#1808)

### 2016-03-29 1.10.3-beta5

* New
    - Docs have been updated! See https://beta.docker.com/docs/

* Known issues
    - There is a race on startup between docker and networking which can
      lead to Docker.app not starting on reboot. The workaround is to
      restart the application manually. (#1808).
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart
      Docker.app (#1224)
    - In VPN mode, the `-p` option needs to be explicitly of the form
      `-p <host port>:<container port>`. `-p <port>` and `-P` will not
      work yet. (#1520)

* Bug fixes and minor changes
    - Update DMG background image (#2098)
    - Show correct VM memory in Settings (#2067)
    - Feedback opens forum, not email (#2066)
    - Fix RAM amount error message (#2026)
    - Fix wording of CPU error dialog (#1940)
    - Remove status from settings (#2058)
    - Check for incompatible versions of Virtualbox (#2056)


### 2016-03.22 1.10.3-beta4

* New features
    - File-sharing: support inotify events so that filesystem events on the
      Mac will trigger filesystem activations inside Linux containers (#822)
    - Install docker-machine in `/usr/local` (#1703)
    - Add an animated popover window to help first-time users get started (#1848)
    - Add `pinata doctor` to diagnose common setup issues such as stray environment variables (#1809)
    - New Beta icon (#1780)

* Known issues
    - There is a race on startup between docker and networking which can
      lead to Docker.app not starting on reboot. The workaround is to
      restart the application manually. (#1808).
    - Docker.app sometimes uses 200% CPU after OS X wakes up from sleep mode.
      The issue is being investigated. The workaround is to restart
      Docker.app (#1224)
    - In VPN mode, the `-p` option needs to be explicitly of the form
      `-p <host port>:<container port>`. `-p <port>` and `-P` will not
      work yet. (#1520)

* Bug fixes and minor changes
    - Hostnet: fix Moby DNS resolver failures by proxying the
      Recursion Available flag (#1698)
    - `docker ps` shows IP address rather than `docker.local` (#1841)
    - Re-enable support for OS X 10.10 (#1748)
    - Fix "Notification Center"-related crash on startup (#1167)
    - Fix watchdog crash on startup (#1558)
    - Ensure binaries are built for 10.10 rather than 10.11 (#1748)
    - `pinata diagnose`: work around bugsnag upload limits (#1845)
      and add more diagnostic tests (#1852)
    - `pinata diagnose`: remove false positives if old launchd plists
      are still present (#1662)

### 2016-03-15 1.10.3-beta3

* New
    - Docs have been updated! See https://beta.docker.com/docs/
    - 6x speedup for sequential write throughput with osxfs (#1607)
    - Rename `bridged` mode to `nat` mode (#1621)
    - Docker runs in debug mode by default for new installs (#1546)
    - Add `pinata diagnose` command to help diagnose problems and upload logs (#1664)

* Upgrades
    - Docker 1.10.3 (#1586)

* Bug fixes and minor changes
    - Add more verbose logging on errors in `nat` mode (#1620, #1522)
    - Fix HockeyApp crash reporting (#1587)
    - Fix get/set VPN mode in settings (#1583)
    - Fix osxfs chmod on sockets (#1570)
    - Fix osxfs EINVAL from `open` using O_NOFOLLOW (#1511)
    - Show correct forwarding details in `docker ps/inspect/port` in `nat` mode (#1564)
    - Auto update automatically checks for new versions again (#1536)
    - Hypervisor stability fixes, resynced with upstream repository (#1531, #1514)
    - Fatal GUI errors now correctly terminate the app again (#1524,#1528)
    - New lines ignored in token entry field (#1498)
    - Fix proxy panics on EOF when decoding JSON (#1489)
    - Clarify open source licenses (#1604, #1677, #1636)
    - Fix long delay/crash when switching from `hostnet` to `nat` mode (#1675)
    - Moby logs included in diagnose upload (#1664)
    - Feedback mail has app-version in subject field (#1653)
    - App version included in logs on startup (#1645)

### 2016-03-08 1.10.2-beta2

* New features
    - Docs have been updated! See https://beta.docker.com/docs/
    - GUI: Add VPN mode / slirp to settings (#1444)
    - GUI: Add disable Time Machine backups of VM disk image to settings (#1429)
    - CLI: `pinata` configuration tool for experimental settings (#1411, #1370)
    - FS: Add guest-guest FIFO and socket file support (#1314)

* Upgrades
    - notary 0.2 (#1447)

* Bug fixes
    - FS: Fix data corruption bug during cp (use of sendfile/splice) (#1384)
    - GUI: Fix About box to contain correct version string (#1289)
    - Slirp/VPN mode: Stability fixes and tests (#1394, #1428, #1434)
    - Slirp/VPN mode: Fix DNS issues when changing networks (#1455)
    - Moby: Clean up Docker startup code (#1398)
    - Fix various linking and dependency problems (#1426, #1378)
    - Logging improvements (#1437)

### 2016-03-01 1.10.2-b1

* GUI
    - Add dialog to explain why we need admin rights (#1284, #1207)
    - Remove shutdown/quit window (#1287)
    - Improve machine migration (#1255)
    - Add "Help" option in menu to open docs webpage (#1237)
    - Add license agreement (#1209)
    - Add MixPanel support (#1206)

* CLI
    - Add `docker-configure` tool to modify experimental settings (#1304, #1293, #1286, #1280, #1266, #1229, #1222, #1311)
    - Add `docker-diagnose` and `docker-configure` to path (#1254)

* Crash reports
    - Add HockeyApp crash reporting (#1260, #1251)

* Task manager
    - Improve signal handling (#1221, #1201, #1246)

* Logging
    - Use ISO timestamps with microsecond precision (#1285)
    - Clean up logging format (#1285)

* Packaging
    - Create `/usr/local` if it doesn't exist (#1307)
    - `docker-uninstall` improvements (#1236)
    - Remove `docker-select` as it's no longer used (#1295)

* Hypervisor
    - Add pid file (#1220)
    - Networking reliability improvements (#1181)

* Bug fixes
    - Slirp: fix port forwarding issue (#1218)
    - Slirp: stability fixes (#1194)
    - Moby: fix setting hostname (#1283)
    - Fix permissions on `/usr/local` symlinks (#1261)

### 2016-02-23 1.10.2-12

* Enrollment System
  - A token is now required to launch the application
  - How to get the token?
    - Sign up on http://beta.docker.com
    - Wait for validation email (or ask for it in #docker-mac channel on Slack)
    - Open the application, token will be requested
    - Internet access is required only once

* API proxy
  - Bug fixes for `docker inspect` (#1051)
  - Stop rewriting volume paths: `/Users`, `/private`, `/tmp` and `/Volumes`
    are now directly mapped into the OSX filesystem. (#1016)
  - Stability fixes (#1097)

* Docker
  - Upgrade to docker 1.10.2 (#1103)

* CLI
  - bundle bash completion from docker, machine and compose (#1036)
  - bundle docker-machine (and its bash completion) (#1027)

* Moby
  - Speed-up exit time: shutdown is now really fast. (#945)
  - Kernel update to 4.1.18 (#1096)

* Hypervisor (com.docker.driver.amd64-linux)
  - Stability fix and more logging for new `freeze` sleep mode (#1026)

* Packaging
  - Move database to `~/Library/Containers/com.docker.docker/Data/database`
  - Move disk image to `~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux`
  - Move Moby logs to `~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/log`

### 2016-02-16 1.10.1-11

* API proxy
  - Rewrite `docker inspect` to rewrite volumes and ports
  - Handle start requests and adjust mounts for `docker-compose` (#918, #924)
  - Add disabled, experimental flag to expose `/var/run/docker.sock` (#953)

* Networking
  - In `slirp` mode, if no IP is specified bind to 0.0.0.0 (#939)
  - `docker ps` will show where the port is really bound, i.e. on
    `docker.local` (#939)
  - New experimental key `native/port-forwarding=false`: if true this will
    perform port forwarding from IP addresses on the host, like regular
    Linux. (#939)

* UI
  - Logs: Remove the log dashboard and link to the log folder instead
  - Buttons: Fix the "Acknowledgements" button (#984)

* Hypervisor (com.docker.driver.amd64-linux)
  - Freeze VM while OSX sleeps (workaround for Apple ACPI bug, issue #147) (#967)
  - Prevent spinning if the tty is disconnected (#869, #996)

* Moby
  - Fix fd leaks inside 9p daemon (#954)
  - Initial user namespace support (#933)
  - New kernel, switch to C transfused (#966)

* Upgrades
  - docker-engine 1.10.1 (#946)
  - notary 1.10-5 (#964)
  - link to latest Kitematic which works out-of-the-box with Docker.app (#957)

* Windows
  - Initial code integration. Now the OSX and Windows apps are built from
    the same source tree.

### 2016-02-09 1.10.0-10

* File system sharing
  - osxfs read corruption fix (#896)
  - osxfs sequential read performance 50% faster (now 75MiB/s)
  - lofs sequential read performance 13x faster (now 60MiB/s)
  - lofs sequential write performance 11x faster (now 50MiB/s)

* Docker socket
  - Socket upload into a container 70% faster (now 17MiB/s)
  - Socket download from a container 30% faster (now 21MiB/s)

* Upgrades
  - docker-engine 1.10.0 (#888)
  - docker-compose 1.6.0 (#890)
  - docker-machine 0.6.0 (#894)

* Networking
  - experimental slirp mode (#903, #902, #901, #887)
    - the internal IP address can be set in the database (keys slirp/docker and slirp/host)
    - the internal IP now defaults to 169.254.0.1,2
    - when port forwarding, binding to 0.0.0.0 works as on Linux (see documentation for limitations)

* Bugfixes
  - Improve proxy stability (#910, #898)

### 2016-02-02 1.10.0-9

NOTE: If you have manually changed the database keys they will be reset to default values after upgrading to this alpha.

* File system sharing
  - osxfs now enabled by default for all users
  - osxfs sequential read throughput is now 10x higher (50MiB/s) (#833, #818, #817)
  - osxfs stability improvements (#816, #787, #785)

* Migration
  - experimental support for migrating containers from Virtualbox on first launch (#842, #725)

* Upgrades
  - docker-engine 1.10.0-rc2
  - docker-compose 1.6.0rc2

* Networking
  - New experimental mode ("slirp") added as a workaround for VPN/firewall issues. This mode is not enabled by default (#843, #838, #836, #815, #809)

* Proxy
  - Stability and logging improvements (#814, #781)

* User interface
  - Logs now displayed under "Logs..."
  - Dashboard links to Kitematic download

* Moby
  - Reduced boot time (#moby/18)

* Database
  - Add initial support for schema upgrades (#846)


### 2016-01-26 1.10.0-8

* Dashboard
  - Include output from docker.log (#728)

* Hypervisor (com.docker.driver.amd64-linux)
  - Shutdown VM while OSX sleeps (workaround for Apple ACPI bug, issue #147) (#711, #694)

* Configuration
  - Linux: Database file to configure hostname, restarts VM on commit
  - Docker: Database file to configure Docker daemon, restarts docker on commit

* Upgrades
  - docker-compose 1.6.0rc1

* File system sharing (experimental)
  - `osxfs`, an experimental shared file system has been integrated (#707)
     which fixes UID/GID mapping (#123) and atomic rename (#668) and has
     twice the sequential write throughput. It is disabled by default
     but can be enabled by writing "osxfs" to the `filesystem` database
     key. Please see the documentation for further details.

### 2016-01-19 1.10.0-7

* Docker
  - upgrade to 1.10.0-rc1 (#650)
  - logs available at ~/Library/Group Containers/group.com.docker/
      com.docker.driver.amd64-linux/docker.log

* Installer
  - symlinks in /usr/local/bin are automatically created on first launch (#674)

* Menubar
  - add a simple dashboard which currently displays logs (#679)

* Packaging
  - Include even more of the open-source component LICENSE text (in
    previous alphas we missed a few packages)
  - Future automatic upgrades will only prompt for admin password if
    the vmnetd protocol has changed, not on every version (#645)
  - New and updated graphic assets (#652)

* Hypervisor (com.docker.driver.amd64-linux)
  - bundle an experimental qemu x86_64 binary (#453)

### 2016-01-12 1.9.1-6

* Packaging
  - Distributed as a .dmg, with cute whale picture!
  - Auto update re-enabled

* Moby
  - Add support for running containers for other architectures (arm, arm64, ppc64le, mips64, mips64le) (#545, #557, #559)
  - Kernel 4.1.15 and aufs fixes (#589)

* Networking (com.docker.vmnetd)
  - Improve performance from host to container (~350 mbit/sec vs ~1.2 gbit/sec) (#566)
  - Add support for rx batching to reduce packet overhead under high load (#566)

* Menubar (Docker.app)
  - Improve process management and logging (#570, #543, #568)

* Hypervisor (com.docker.driver.amd64-linux)
  - Add support for switching between hypervisors (xhyve, qemu) by writing to the db (#562)
  - Proxy: handle old-style protocol upgrades to fix compose and terminal issues (#569)


### 2016-01-05 1.9.1-5

Note: This version requires a manual uninstall of earlier alpha versions. See documentation for details.

* Main Window (former Kitematic)
  - main Window removed from this alpha, waiting for new mockups and decision about JS (+ smooth transition from Kitematic) versus Swift implementation (#477)

* Docker Terminal
  - "Open Terminal" removed. See documentation for CLI tool installation instructions. (#513)

* Settings
  - login autostart checkbox (ON by default) (#477)

* Moby
  - faster boot time
  - upgrade to Alpine 3.3 final
  - diagnostics tool
  - installer for docker-x

* Hypervisor
  - support more than 3GiB of RAM (`git commit` new value to ~/Library/Application Support/Docker/database/com.docker.driver.amd64-linux/memory) (#473, #474)
  - bundle `qcow-tool` for manual creation of larger `Docker.qcow2` files (#501)
  - enable ACPI support (#525)

* Installer
  - launchd socket activation is removed; services (including hypervisor and containers) run while the whale menu is running. (#477)
  - the app is not automatically copied in /Applications anymore (#477)
  - the app can run from any location (#477)
  - uninstall dragging application's icon to the trash (may not work for vmnetd) (#477)

* Packaging
  - OSS Licenses of software running on the Host in Docker.app/Contents/Resources/OSS-LICENSES (#495, #491, #483)


### 2015-12-21 1.9.1-4

* moby
  - use AUFS instead of OverlayFS

* network:
  -  vmnetd: improve performance. disabling verbose logging improve perfs
     from ~2MB/s to ~30-40MB/s (#443)

* in-app support
  - docker-diagnose: add capability to upload to bugsnag, upload sysctl and
    logs to bugsnag and add a JSON output (#428, #429, #430)
  - xhyve: log fatal errors to bugsnag (#425)

* toolbox
  - compose: bundle and install docker-compose (#423, by @justincormack)
  - notary: bundle notary but do not install it yet because the generated
    binary has some signing issue (#445)

* DB
  - bundle and install com.docker.db, an Irmin DB exposing a 9p interface
    (#403, #415)
  - update the Go API to use the new FS interface (#90)

* installer
  - docker-select now creates `/usr/local/bin` if it doesn't exists and force
    install docker CLI and docker-compose if they are not properly installed
    yet (#446)


### 2015-12-15 1.9.1-3

* Critical fix to 1.9.1-2 regarding auto-update
  - Alpha-2 use the `master` channels instead of the `alpha` channel

### 2015-12-14 1.9.1-2

* hypervisor
  - process renamed to com.docker.driver.amd64-linux

* distro (dom0)
  - first release of moby, our own OS distro

* network
  - privileged daemon renamed to com.docker.vmnetd
  - network daemon can now auto-update

* storage (file-sharing)
  - file-sharing daemon renamed to com.docker.lofs

* installer
  - install a proof-of-concept preference-panel
  - report installation bug to bugsnag
  - Docker.app is now properly signed
  - The installer gives more feedback to the user
  - need to run /Applications/Docker.app/Contents/Resources/docker-select
    to install CLI tools
  - configuration files are in ~/Library/Application Support/Docker

* kitematic
  - volumes works
  - image pull works
  - port forwarding works

* preference-pane
  - basic proof-of-concept

* menubar
  - allow to open a terminal
  - allow to start the GUI
  - allow to open the preference pane
  - allow to check for upgrades and upgrade to a new version   2015-12-04 1.9.1-1 "Alpha-1"

### 2015-12-04 1.9.1-1

* hypervisor
  - more stable
  - extensible storage (qcow2) for guests can now grow to 64 gB
  - fixed amount of RAM extended to 2GB

* installer
  - install and start kitematic
  - smaller: ~450MB
  - auto-updates

* Kitematic
  - modified version of Kitematic which do not requires VirtualBox

* menubar
  - show HockeyApp version
  - allow to upgrade to new version
  - persisted on reboot
  - appears whenever the hypervisor is started

* user-feedback
  - docker-diagnose
  - use bugsnag

### 2015-11-30 1.9.1-0

  * hypervisor
  - stable enough to boot a few times
  - use qcow2 for extensible copy-on-write storage for guests (can grow to 1gB)
  - fixed amount of RAM (1GB)

  * distro (dom0)
  - heavily trimmed-down version of boot2docker
  - still >100 MB

  * network
  - network daemon runs as root
    - blocker for integration in the App Store
  - docker.local points to the distro VM

  * storage (file-sharing)
  - basic file-sharing works over 9p
  - not POSIX (issues with symlink, …)
  - all files have the same user/group
  - file timestamps can be wrong

  * installer
  - install hypervisor, network daemon, storage daemon, docker CLI and menu-bar
  - install docker in /usr/local/bin
  - very big: 1GB
  - report installation stats to mixpanel

  * docker
  - upstream docker CLI 1.9.1 on OSX
  - upstream docker daemon running in boot2docker
  - simple proxy to rewrite volumes API running in OSX
    - symlink /var/tmp/docker.sock to /var/run/docker.sock
    - need root privileges on every reboot: blocker for App Store
  - not very secure

* menubar
  - doesn’t do anything useful
  - Not persisted on reboot

