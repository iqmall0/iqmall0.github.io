const animalIDCell = newRow.insertCell(0);
            const inspectionDateCell = newRow.insertCell(1);
            const currentWeightCell = newRow.insertCell(2);
            const weightDifferenceCell = newRow.insertCell(3);

            animalIDCell.textContent = animalID;
            inspectionDateCell.textContent = inspectionDate;
            currentWeightCell.textContent = currentWeight;
            weightDifferenceCell.textContent = weightDifference.toFixed(2);

            // Kosongkan borang selepas rekod ditambah
            document.getElementById("weightForm").reset();

            // Kemaskini data graf
            updateGrowthGraph(animalID, inspectionDate, currentWeight);
        }

        function updateGrowthGraph(animalID, date, weight) {
            // Periksa sama ada ID ternakan sudah ada dalam graf
            if (!growthData[animalID]) {
                growthData[animalID] = {
                    labels: [],
                    data: []
                };
            }

            // Tambah data baru
            growthData[animalID].labels.push(date);
            growthData[animalID].data.push(weight);

            // Kemaskini data graf untuk ID ternakan yang dipilih
            growthChart.data.labels = growthData[animalID].labels;
            growthChart.data.datasets[0].data = growthData[animalID].data;
            growthChart.update();
        }
    </script>
</body>
</html>