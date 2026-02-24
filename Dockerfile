FROM node:20.11.1-alpine

#damit es mit den Kommandos bei Installation keine Probleme
# auf dem lokalen host gibt
USER= root

#sicherstellen, dass es für die Applikation lokal das
# Verzeichnis app auch existiert
RUN mkdir /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

WORKDIR /usr/src/app

COPY package*.json /usr/src/app
#und gemäss der Paketlisten alle dependencies installieren
RUN npm install

COPY . /usr/src/app

EXPOSE 4000
#hiermit sicherstellen, dass für den Betrieb der
#Anwendung keine Adminrechte zur Verfügung stehen
USER= nobody

CMD ["npm", "start"] 