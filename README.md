# riscv-busybear-linux
Busybear RISCV Linux

```sh
docker pull reshabhsh/riscv-linux:v1 
```

Please run the container in --privileged mode

```
Username: root
Password: busybear
```

If you want to tweak the configuration before running qemu:
```sh
docker pull reshabhsh/riscv-linux:v2
# Inside the container run image.sh for starting qemu
```

Credits: Derived from the awesome work hosted here: https://github.com/michaeljclark/busybear-linux
