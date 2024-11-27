```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Evaluación de Desempeño Empresarial</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            background-color: white;
            padding: 20px;
            margin: 0 auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input, select, button {
            margin: 10px 0;
            padding: 10px;
            font-size: 16px;
        }
        button {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #218838;
        }
        #reportMessage {
            margin-top: 20px;
            font-weight: bold;
            color: #b30000;
        }
        #pieChartCanvas {
            max-width: 100%;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Registro de Usuarios</h1>
        <form id="registrationForm">
            <input type="text" id="userId" placeholder="ID de Usuario" required>
            <input type="text" id="userName" placeholder="Nombre Completo" required>
            <input type="text" id="userDepartment" placeholder="Departamento" required>
            <button type="submit">Registrar</button>
        </form>

        <h2>Formulario de Evaluación</h2>
        <form id="evaluationForm">
            <input type="hidden" id="totalScore" value="0">
            <label>¿Alcanzó el empleado los objetivos establecidos?</label>
            <select data-points="1,0">
                <option value="1">Sí</option>
                <option value="0">No</option>
            </select>
            
            <label>¿Qué impacto tuvieron los logros del empleado en la empresa?</label>
            <select data-points="1,0.5,0">
                <option value="1">Alto</option>
                <option value="0.5">Medio</option>
                <option value="0">Bajo</option>
            </select>
            
            <label>¿Cómo calificaría la calidad de los resultados obtenidos por el empleado?</label>
            <select data-points="2,1,0.5,0">
                <option value="2">Excelente</option>
                <option value="1">Buena</option>
                <option value="0.5">Regular</option>
                <option value="0">Deficiente</option>
            </select>

            <label>¿Cómo calificaría la capacidad del empleado para adaptarse a cambios?</label>
            <select data-points="2,1,0.5,0">
                <option value="2">Excelente</option>
                <option value="1">Buena</option>
                <option value="0.5">Regular</option>
                <option value="0">Deficiente</option>
            </select>

            <label>¿Qué nivel de iniciativa y proactividad demostró el empleado?</label>
            <select data-points="1,0.5,0">
                <option value="1">Alto</option>
                <option value="0.5">Medio</option>
                <option value="0">Bajo</option>
            </select>

            <label>¿Qué nivel de desarrollo de habilidades y conocimientos demostró el empleado durante el periodo de evaluación?</label>
            <select data-points="1,0.5,0">
                <option value="1">Alto</option>
                <option value="0.5">Medio</option>
                <option value="0">Bajo</option>
            </select>

            <label>¿Cumple con los plazos establecidos para sus tareas?</label>
            <select data-points="1,0">
                <option value="1">Sí</option>
                <option value="0">No</option>
            </select>

            <label>¿Coopera con sus compañeros de trabajo?</label>
            <select data-points="1,0">
                <option value="1">Sí</option>
                <option value="0">No</option>
            </select>

            <label>¿Se esfuerza por mejorar continuamente su trabajo?</label>
            <select data-points="1,0">
                <option value="1">Sí</option>
                <option value="0">No</option>
            </select>

            <label>¿Respeta normas y políticas de la empresa?</label>
            <select data-points="1,0">
                <option value="1">Sí</option>
                <option value="0">No</option>
            </select>

            <label>¿Acepta y maneja las críticas constructivas de sus superiores?</label>
            <select data-points="1,0">
                <option value="1">Sí</option>
                <option value="0">No</option>
            </select>

            <button type="submit">Enviar Evaluación</button>
        </form>

        <h2>Generación de Reportes</h2>
        <button onclick="generateReport()">Generar Reporte</button>
        <div id="reportMessage"></div>
        <canvas id="pieChartCanvas" width="400" height="400"></canvas>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.getElementById('registrationForm').onsubmit = function(event) {
            event.preventDefault();
            alert('Usuario registrado!');
            // Aquí se implementaría la lógica de registro
        };

        document.getElementById('evaluationForm').onsubmit = function(event) {
            event.preventDefault();
            let totalScore = 0;
            const formElements = event.target.elements;
            
            for (let element of formElements) {
                if (element.tagName === 'SELECT') {
                    const value = parseFloat(element.value);
                    totalScore += value;
                }
            }
            
            document.getElementById('totalScore').value = totalScore;
            alert('Evaluación enviada con puntuación: ' + totalScore);
        };

        function generateReport() {
            const totalScore = parseFloat(document.getElementById('totalScore').value);
            const userId = document.getElementById('userId').value;
            const userName = document.getElementById('userName').value;
            const userDepartment = document.getElementById('userDepartment').value;
            const messageElement = document.getElementById('reportMessage');

            const ctx = document.getElementById('pieChartCanvas').getContext('2d');
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ['Sí', 'No', 'Medio', 'Bajo', 'Regular', 'Deficiente'],
                    datasets: [{
                        data: [20, 10, 5, 2, 3, 1],
                        backgroundColor: ['green', 'red', 'orange', 'yellow', 'blue', 'purple']
                    }]
                },
                options: {}
            });

            if (totalScore > 10) {
                messageElement.textContent = `${totalScore} puntos: ${userName} (ID: ${userId}) del Departamento ${userDepartment} No necesita capacitación`;
            } else if (totalScore < 8) {
                messageElement.textContent = `${totalScore} puntos: ${userName} (ID: ${userId}) del Departamento ${userDepartment} necesita capacitación`;
            } else {
                messageElement.textContent = '';
            }
        }
    </script>

</body>
</html>
