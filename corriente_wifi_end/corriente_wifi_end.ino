//#include <SoftwareSerial.h>
//
//int potenciometro_pin=0;
//int cont = 0;
//double valor, rms=0;
//SoftwareSerial ModuloWiFi(3,2); // RX, TX
//
//void getrequest(double i){
//  ModuloWiFi.write("AT+CIPSTART=\"TCP\",\"192.168.1.3\",80\r\n");
//  delay(10);
//  int longi = String(i).length()+60;
//  ModuloWiFi.print("AT+CIPSEND=");
//  ModuloWiFi.print(longi);
//  ModuloWiFi.print("\r\n");
//  delay(10);
//  ModuloWiFi.print("GET /registrar.php?valor=");
//  ModuloWiFi.print(i);
//  ModuloWiFi.print(" HTTP/1.1\r\nHost: 192.168.43.111\r\n\r\n");
//}
//
//void setup(){
//  Serial.begin(9600);
//  ModuloWiFi.begin(115200);
//}
//
//void loop(){
//  while(cont<100){
//    valor = ((513 - analogRead(potenciometro_pin))*5/1023.0)/0.1;
//    rms += valor*valor;
//    cont++;
//    delay(1);      
//  }
//  rms = sqrt(rms/cont);
//  getrequest(rms);
//  cont = 0;
//  rms = 0;
//  delay(1000);
//}

#include <SoftwareSerial.h>
int voltaje_pin=0, corriente_pin=1;
double valor_corriente[110],valor_voltaje[110];
int i=0, j=0, tiempo;
double a,b,pot;
 SoftwareSerial ModuloWiFi(3,2); // RX, TX

void GETrequest(double i){
  ModuloWiFi.write("AT+CIPSTART=\"TCP\",\"192.168.1.3\",80\r\n");
  delay(10);
  int longi = String(i).length()+56;
  ModuloWiFi.print("AT+CIPSEND=");
  ModuloWiFi.print(longi);
  ModuloWiFi.print("\r\n");
  delay(10);
  ModuloWiFi.print("GET /realtime/add?value=");
  ModuloWiFi.print(i);
  ModuloWiFi.print(" HTTP/1.1\r\nHost: 192.168.1.3\r\n\r\n");
}

void setup(){
 Serial.begin(115200);
 ModuloWiFi.begin(115200);   
}

void loop(){
  
   i=0;
   tiempo = millis();
   while(i< 100 ){
     valor_corriente[i] = analogRead(corriente_pin);
     delay(1);
     valor_voltaje[i] = analogRead(voltaje_pin);
     delay(1);
     i++;
   }
   
   j=20;
   pot=0;
   while(j<=i-4){
    a=(((512 - valor_corriente[j])*5/1023.0)/0.1);
    b=(((513 - valor_voltaje[j])*5/1023.0));
    b=(b-1.024)*143;
    a=a*1.45;
    //Serial.println("dayan es puta");
    //Serial.println(a,4);
    //Serial.print(";");
    //Serial.println(b,4);
    pot+=a*b;
    j++;
   }
       //Serial.println(j);
    //Serial.println(i);
    if (pot<0) {
      pot=0.0;
      }
    pot=pot/(j-20);
   Serial.println(pot,4);
   GETrequest(pot);
 double  valor_corriente[110]={0};
 double  valor_voltaje[110]={0};
   delay(2000);
}
