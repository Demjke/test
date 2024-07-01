<!-- 1. Используя команду cat в терминале операционной системы Linux, создать два файлаДомашниеживотные(заполнивфайлсобаками,кошками, хомяками) и ВьючныеживотнымизаполнивфайлЛошадьми,верблюдамии ослы), а затем объединить их. Просмотреть содержимое созданного файла. Переименовать файл, дав емуновоеимя(Друзьячеловека). -->

cat > homeAnimals 
cat > packAnimals 
cat homeAnimals packAnimals > animals 
cat animals 
mv animals peopleFriends 
ls -ali

<!-- Создать директорию, переместить файл туда. -->

mkdir Test 
mv peopleFriends ~/Test 
cd ~/Test ls -ali

<!-- Подключить дополнительный репозиторий MySQL. Установить любой пакет из этого репозитория. -->

sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.23-1_all.deb 
sudo dpkg -i mysql-apt-config_0.8.23-1_all.deb 
sudo apt-get update 
sudo apt-get install mysql-server

<!-- Установить и удалить deb-пакет с помощью dpkg. -->

sudo wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_20.10.13~3-0~ubuntu-jammy_amd64.deb 
sudo dpkg -i docker-ce-cli_20.10.133-0ubuntu-jammy_amd64.deb 
sudo dpkg -r docker-ce-cli
