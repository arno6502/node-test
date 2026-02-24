FROM node:20.11.1-alpine

#damit es mit den Kommandos bei Installation keine Probleme
# auf dem lokalen host gibt
USER= root

#sicherstellen, dass es für die Applikation lokal das
# Verzeichnis app auch existiert
RUN mkdir /usr/src/app
 
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 4000
#hiermit sicherstellen, dass für den Betrieb der
#Anwendung keine Adminrechte zur Verfügung stehen
USER= nobody

CMD ["npm", "start"] 