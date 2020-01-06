# encoding: utf-8

import sys
import os
import matplotlib
import matplotlib.pyplot as plt
import json
from gevent.pywsgi import WSGIServer
# https://github.com/grst/nbimporter | pip install nbimporter
import nbimporter
from packingModelisation import problemResolution
from flask import Flask, jsonify, request
from flask_restful import Api, Resource, reqparse

app = Flask(__name__)
api = Api(app)

# Permet de choper notre liste de legumes
@app.route('/get/vegetable')
def getVegetable():
     with open('../Perma_model/data_model/plant-associations.json', 'r', encoding='utf-8') as f:
        allPlants = json.load(f)
        plants = []
        cpt = 0
        for plant in allPlants:
            dict = {
                    "id":cpt,
                    "name":plant
                   }
            cpt+=1
            plants.append(dict)
        print(str(plants))
        return json.dumps(plants)

# Envoi un fichier json pour le sauvegarder sur le serveur
@app.route('/send/<string:name>', methods = ['POST'])
def send(name):
    # Ici on ira pas dans ce dossier à terme vu qu'on sera dans l'application là ou sont
    # save les données de l'utilisateur
    input_json = request.get_json()
    with open('./userJSON/'+ str(name) + '.json', 'w', encoding='utf-8') as outfile:
        json.dump(input_json, outfile)
    # Je dois enregistrer ce json sur le serveur
    return str(input_json)

# Genere un fichier json sur le serveur contenant les positions des legumes
@app.route('/generate/<string:user>/<string:iteration>')
def generateModel(user, iteration):
    print(user)
    problemResolution("./userJSON/"+ str(user) +'.json', int(iteration))
    return "200"

# Recupere un fichier json du serveur contenant les positions des legumes
@app.route('/models/<string:name>/<string:idJardin>/<string:version>')
def getFromServer(name, idJardin, version):

    # Ici ca sera le dossier present sur le serveur, apres que le modele est sauvegardé ce json
    # unique avec un identifiant bien distinct : toDisplay-Identifiant-Number (Number of jardin) pour
    # pouvoir lui en afficher plusieurs qui sont à lui (à terme ils seront enregistré dans l'application)
   with open('./userJSON/'+str(name) +'_'+ str(idJardin) +'_'+ str(version)+'.json', 'r', encoding='utf-8') as f:
      sendToModele = json.load(f)
      return json.dumps(sendToModele)

app.debug = True
http_server = WSGIServer(('109.238.10.82', 5000), app)
http_server.serve_forever()
