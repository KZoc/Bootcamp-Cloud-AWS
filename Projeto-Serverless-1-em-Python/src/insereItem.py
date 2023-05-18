import json
import logging
import os
import time
import uuid

import boto3
dynamodb = boto3.resource('dynamodb')


def insereItem(event, context):
    data = json.loads(event['body'])
    if 'text' not in data:
        logging.error("Validation Failed")
        raise Exception("Não pode criar o item.")
    
    timestamp = str(time.time())

    table = dynamodb.Table(os.environ['TabelaServerless'])

    item = {
        'id': str(uuid.uuid1()),
        'text': data['text'],
        'checked': False,
        'createdAt': timestamp,
        'updatedAt': timestamp,
    }

    # Adicionando o item na tabela
    table.put_item(Item=item)

    # Criando o response
    response = {
        "statusCode": 200,
        "body": json.dumps(item)
    }

    return response
