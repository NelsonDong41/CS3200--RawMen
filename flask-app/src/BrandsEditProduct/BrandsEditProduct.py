from flask import Blueprint, request, jsonify, make_response
import json
from src import db

BrandsEditProduct = Blueprint('BrandsEditProduct', __name__)

# Brand's Edit Product page hi
