# Cloud Centos on KVM

## Download a Centos Cloud image

```
wget http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1503.qcow2
```

## Resize the image

```
cp entOS-7-x86_64-GenericCloud-1503.qcow2 test.qcow2
qemu-img resize test.qcow2 50G
```

## Create a cloud-init ISO

- Edit user-data and metadata and run

```
genisoimage -o ./test-cloud-init.iso -V cidata -r -J meta-data user-data
```

## Copy the image and the iso to any libvirt storage pool. 

```
sudo cp test.qcow2 /var/lib/libvirt/images
sudo cp test-cloud-init.iso /var/lib/libvirt/images
sudo virsh pool-refresh default
```

## Launch the instance

```
sudo virt-install -n test -r 1024 -w network=default --disk vol=default/test.qcow2,size=100 --import --disk path=test.iso,device=cdrom
```
