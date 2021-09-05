# Ubuntu 20.0.4 full disk encryption :
Scripts pour installer Ubuntu 20.04 sur un disque entière chiffré.
L'itération pour le chiffrement de la partition de boot a été diminuée pour avoir un temps de boot plus court.
Le pbkdf est au format argon2
LVM aligne ses blocs sur 1M
Crytpsetup aligne ses blocs sur 2048

--

Scripts to install Ubuntu 20.04 on an encrypted full disk.
The iteration for boot partition encryption has been reduced to have a shorter boot time.
The pbkdf is in argon2 format
LVM aligns its blocks to 1M
Crytpsetup aligns its blocks to 2048

--

## Installation :
1. Démarrer depuis un live CD
2. Passer en root
3. Rendre les scripts executables (chown -r +x ./)
4. Executer les scirpts 01 à 03
5. Lancer l'installation

    5.1. Choissir personnaliser pour le partionnement

    5.2. Formater la partition LUKS_BOOT en ext4 et la monter en /boot

    5.3. Formater la partition nvme0n1p5_crypt en ext4 et la monter en /root

    5.4. Choissir le format swap pour la partition de swap

6. Pendant l'installation executer le script 04
7. Après l'installation, executer les scripts 05 et 06
8. Rendre le script 07 executable puis le lancer
9. Sortir du Chroot puis redémarrer

--

1. Boot from a live CD
2. Change to root
3. Change the scripts permission for execute (chown -r + x ./)
4. Execute scirpts 01 to 03
5. Start the installation

     5.1. Choose customize for partitioning

     5.2. Format the LUKS_BOOT partition in ext4 and mount it in / boot

     5.3. Format the nvme0n1p5_crypt partition in ext4 and mount it in / root

     5.4. Choose the swap format for the swap partition

6. During installation run script 04
7. After installation, run scripts 05 and 06
8. Make script 07 executable then run it
9. Exit the Chroot then restart

--

## Source :
Les scripts suivent le tutoriel : 
[https://help.ubuntu.com/community/Full_Disk_Encryption_Howto_2019](https://help.ubuntu.com/community/Full_Disk_Encryption_Howto_2019)

sauf pour créer le chroot et les options de chiffrement + lvm

--

The scripts follow the tutorial:
[https://help.ubuntu.com/community/Full_Disk_Encryption_Howto_2019](https://help.ubuntu.com/community/Full_Disk_Encryption_Howto_2019)

except to create the chroot and the encryption options + lvm

## Performance :
Quelques tests réalisés avec la suite Phoronix

Sans chiffrement : [https://openbenchmarking.org/result/2108286-SKAN-BENCH1767](https://openbenchmarking.org/result/2108286-SKAN-BENCH1767)

Avec chiffrement : [https://openbenchmarking.org/result/2109054-SKAN-BENCH1720](https://openbenchmarking.org/result/2109054-SKAN-BENCH1720)

--

Some tests carried out with the Phoronix suite

Without encryption : [https://openbenchmarking.org/result/2108286-SKAN-BENCH1767](https://openbenchmarking.org/result/2108286-SKAN-BENCH1767)

With encryption : [https://openbenchmarking.org/result/2109054-SKAN-BENCH1720](https://openbenchmarking.org/result/2109054-SKAN-BENCH1720)

