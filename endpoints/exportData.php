<?php

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Content-Disposition: attachment; filename="exported_data.json"');

function exportXMLToJSON()
{
    $xmlFile = 'XML/veeNaidud.xml';
    if (!file_exists($xmlFile)) {
        http_response_code(404);
        echo json_encode(['error' => 'XML file not found']);
        exit();
    }

    $xml = simplexml_load_file($xmlFile);
    
    if ($xml === false) {
        http_response_code(500);
        echo json_encode(['error' => 'Failed to load XML']);
        exit();
    }

    $jsonData = [];
    
    foreach ($xml->veeNaide as $veeNaide) {
        $item = [
            'email' => (string)$veeNaide['email'],
            'aadress' => (string)$veeNaide->aadress,
            'korterinumber' => (string)$veeNaide->korterinumber,
            'kuupaev' => (string)$veeNaide->kuupaev,
            'vesi' => [
                'kulmVesi' => (string)$veeNaide->vesi->kulmVesi,
                'soeVesi' => (string)$veeNaide->vesi->soeVesi
            ],
            'makstud' => (string)$veeNaide->makstud
        ];

        $jsonData[] = $item;
    }

    echo json_encode($jsonData, JSON_PRETTY_PRINT);
}

exportXMLToJSON();
