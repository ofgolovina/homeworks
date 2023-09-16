# ---- adding  new virtual disks
# ---- VirtualBox 5.2 , 2xVMDK disks

(
echo n
echo p
echo 1
echo  
echo  
echo wq
) | fdisk /dev/sdb
(
echo t 
echo 8e 
echo wq
 ) | fdisk /dev/sdb

(
echo n
echo p
echo 1
echo  
echo  
echo wq
) | fdisk /dev/sdc
(
echo t 
echo 8e 
echo wq
 ) | fdisk /dev/sdc

# ---- creating vg and array 

pvcreate /dev/sdb1 -ff -y
pvcreate /dev/sdc1 -ff -y
vgcreate vg01 /dev/sdb1 /dev/sdc1
echo "y" | mdadm --create --verbose /dev/md0 -l 1 -n 2 /dev/sd{b,c}




