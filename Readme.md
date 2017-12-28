DRN-GSMPI
DRNKITS-RASPBERRY PI GSM SHIELD KURULUM KILAVUZU

Lütfen herhangi bir işleme başlamadan önce Kullanma Kılavuzunu inceleyiniz.

1- Raspberry PI üzerinde son Raspbian sürümünün kurulu, sim kartın takılı ve PIN kodunun kaldırıldığından emin olduktan sonra aşağıdaki gibi bağlantıları yapalım ve güç adaptörünü fişe takalım.

2- Ürün ile beraber gelen (veya https://github.com/EduBoxVAR/DRNKITS-Raspberry-GPRS linkinden dosyalar indirilebilir.) CD içerisinde “DRNKITS-Raspberry-GPRS.zip” dosyasını Desktop directory’sine (kullanıcı istediği yere kopyalayabilir) unzip ettikten sonra Terminal üzerinden aşağıdaki komutlar yazılır. 

	pi@raspberrypi:~ $ cd Desktop/DRNKITS-Raspberry-GPRS/
	pi@raspberrypi:~/Desktop/DRNKITS-Raspberry-GPRS $ 

3- repository e gelelim ve kurulum işlemlerine başlayalım. Öncelikle kurulum script dosyası olan “modem_setUP.sh” dosyasına chmod +x ile erişim izni verilir.

	pi@raspberrypi:~/Desktop/DRNKITS-Raspberry-GPRS $ chmod +x modem_setUP.sh
	pi@raspberrypi:~/Desktop/DRNKITS-Raspberry-GPRS $ sudo ./modem_setUP.sh

 4- Kurulum tamamlandıkan sonra bluetooth servislerini devre dışı bırakmak için aşağıdaki komutu çalıştırın.
	
	pi@raspberrypi:~/Desktop/DRNKITS-Raspberry-GPRS $ systemctl mask serial-getty@ttyAMA0.service

5- Sonra modem Raspberry PI GPIO pinleri aracılığıyla çalıştırılır. 

	pi@raspberrypi:~/Desktop/DRNKITS-Raspberry-GPRS $ ./modem_powerUp.sh
	

6- internet bağlantısı için;

	pi@raspberrypi:~/Desktop/DRNKITS-Raspberry-GPRS $ chmod +x ./ppp¬-creator.sh
	
	pi@raspberrypi:~/Desktop/DRNKITS-Raspberry-GPRS $ sudo ./ppp-¬creator.sh mgbs ttyAMA0 
	

7- Modem ile haberleşme ve internet bağlantısı için gerekli bütün ayarlar yapılmıştır. 
    Rasperry PI reboot edilir. 

8- Terminal üzerinden “sudo pppd call gprs” veya “sudo pon gprs” veya bu komutların sonuna “&” eklenerek arka planda bağlantının devam etmesi sağlanır. Yani “sudo pppd call gprs&” veya “sudo pon gprs&” şeklinde komutlar uygulanır.
	
	
	pi@raspberrypi:~ $ sudo pon gprs&
	[1] 2121	
	pi@raspberrypi:~ $ pppd options in effect:
	
	...

9- Artık internet bağlantısı ppp protokolü üzerinden sağlanmıştır.

	pi@raspberrypi:~ $ ifconfig ppp0 
	
	ile interface’in almış olduğu IP adresi görülebilmektedir.

10- ping testi için;

    pi@raspberrypi:~ $ ping www.google.com -I ppp0

    komutu ile GPRS üzerinden www.google.com adresine ping işlemi başlatılmış olacaktır.
   
11- internet bağlantısının kesilmesi için;

    pi@raspberrypi:~ $sudo poff   ile internet bağlantısı kesilmiş olacaktır.
