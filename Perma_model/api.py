import sys
import os
import matplotlib
import matplotlib.pyplot as plt
import json

# https://github.com/grst/nbimporter | pip install nbimporter
import nbimporter
from packingModelisation import problemResolution
from flask import Flask, jsonify, request
from flask_restful import Api, Resource, reqparse


app = Flask(__name__)
api = Api(app)


@app.route('/send/<string:name>', methods=["POST"])
def send(name):
    # Ici on ira pas dans ce dossier à terme vu qu'on sera dans l'application là ou sont
    # save les données de l'utilisateur
    input_json = request.get_json()
    with open('./userJSON/'+name+'.json', encoding='utf-8') as outfile:
        json.dump(input_json, outfile)
    # Je dois enregistrer ce json sur le serveur
    return str(input_json)

@app.route('/get/<string:path>')
def getFromServer(path):

    # Ici ca sera le dossier present sur le serveur, apres que le modele est sauvegardé ce json
    # unique avec un identifiant bien distinct : toDisplay-Identifiant-Number (Number of jardin) pour
    # pouvoir lui en afficher plusieurs qui sont à lui (à terme ils seront enregistré dans l'application)
    with open('./userJSON/'+path) as f:
        sendToModele = json.load(f)
        return jsonify(sendToModele)

@app.route('/get/vegetable')
def getVegetable():
     with open('../Perma_model/data_model/plant-associations.json', encoding='utf-8') as f:
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

@app.route('/generate/<string:name>/<int:iteration>')
def generateModel(name, iteration):
    problemResolution("./userJSON/"+ name +'.json', iteration)
    return "ok"

app.debug = True
app.run(host='109.238.10.82', port='5000')
