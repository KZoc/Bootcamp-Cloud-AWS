import json
import os
import logging

import boto3


dynamodb = boto3.resource('dynamodb')

NomeDaTabela = 'Tabela_Cognito_Manual'


def insereItem(event, context):
    data = json.loads(event['body'])
    if 'text' not in data:
        logging.error("Validation Failed")
        raise Exception("Não pode criar o item.")
    

    table = dynamodb.Table(os.environ[NomeDaTabela])

    item = {
        id: id,
        price: price
    }

    # Adicionando o item na tabela
    table.put_item(Item=item)

    # Criando o response
    response = {
        "statusCode": 200,
        "body": json.dumps(item)
    }

    return response