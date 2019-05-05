FROM python:3.6

#Dossier contenant l'API
COPY ./ /app 

#Chemin vers le dossier copié
WORKDIR /app/

#Install des requierment
RUN pip3 install -r /app/requirements.txt

#le port
EXPOSE 5000

#Commande de lancement de l'API
CMD python3.6 ./api.py
