// ============================================
// CONSULTAS DO SISTEMA DE ATENDIMENTO MÉDICO
// ============================================

// ============================================
// CONSULTA 1: Listar médicos de uma especialidade específica
// ============================================
MATCH (med:Médico)-[:POSSUI_ESPECIALIDADE]->(esp:Especialidade {nome: 'Pediatra'})
RETURN med.nome AS NomeMedico, 
       med.crm AS CRM, 
       med.telefone AS Telefone,
       esp.nome AS Especialidade
ORDER BY med.nome;

// Para outras especialidades, altere o nome:
// - 'Oftalmologista'
// - 'Cardiologista'

// ============================================
// CONSULTA 2: Encontrar médicos que aceitam um determinado plano de saúde
// ============================================
// Exemplo: Médicos que aceitam Unimed
MATCH (med:Médico)-[:ACEITA_PLANO]->(plano:PlanoSaude {nome: 'Unimed'})
RETURN med.nome AS NomeMedico,
       med.crm AS CRM,
       plano.nome AS PlanoSaude,
       plano.tipo AS TipoPlano
ORDER BY med.nome;

// Para outros planos, altere o nome:
// - 'Amil'
// - 'SulAmérica'

// ============================================
// CONSULTA 3: Listar hospitais e os médicos que atendem neles
// ============================================
MATCH (med:Médico)-[r:ATENDE_EM]->(hosp:Hospital)
RETURN hosp.nome AS Hospital,
       hosp.endereco AS Endereco,
       collect(med.nome) AS Medicos,
       count(med) AS TotalMedicos
ORDER BY hosp.nome;

// Versão detalhada com informações dos médicos
MATCH (med:Médico)-[r:ATENDE_EM]->(hosp:Hospital)
OPTIONAL MATCH (med)-[:POSSUI_ESPECIALIDADE]->(esp:Especialidade)
RETURN hosp.nome AS Hospital,
       med.nome AS Medico,
       med.crm AS CRM,
       collect(esp.nome) AS Especialidades,
       r.desde AS AtendeDesde
ORDER BY hosp.nome, med.nome;

// ============================================
// CONSULTA 4: Obter todas as consultas de um paciente
// ============================================
// Exemplo: Consultas do paciente Roberto Mendes
MATCH (pac:Paciente {nome: 'Roberto Mendes'})-[:REALIZOU]->(cons:Consulta)-[:FOI_REALIZADA_POR]->(med:Médico)
RETURN pac.nome AS Paciente,
       cons.data AS DataConsulta,
       cons.horario AS Horario,
       cons.tipo AS TipoConsulta,
       cons.observacoes AS Observacoes,
       med.nome AS Medico,
       med.crm AS CRM
ORDER BY cons.data DESC, cons.horario;

// Para listar todos os pacientes e suas consultas:
MATCH (pac:Paciente)-[:REALIZOU]->(cons:Consulta)-[:FOI_REALIZADA_POR]->(med:Médico)
RETURN pac.nome AS Paciente,
       count(cons) AS TotalConsultas,
       collect({
         data: cons.data,
         horario: cons.horario,
         tipo: cons.tipo,
         medico: med.nome
       }) AS Consultas
ORDER BY pac.nome;

// ============================================
// CONSULTA 5: Listar especialidades disponíveis em determinado hospital
// ============================================
// Exemplo: Especialidades disponíveis no Hospital São Paulo
MATCH (hosp:Hospital {nome: 'Hospital São Paulo'})<-[:ATENDE_EM]-(med:Médico)-[:POSSUI_ESPECIALIDADE]->(esp:Especialidade)
RETURN hosp.nome AS Hospital,
       esp.nome AS Especialidade,
       count(DISTINCT med) AS QuantidadeMedicos,
       collect(DISTINCT med.nome) AS Medicos
ORDER BY esp.nome;

// Para outros hospitais, altere o nome:
// - 'Hospital Albert Einstein'
// - 'Hospital Sírio-Libanês'
// - 'Hospital das Clínicas'
// - 'Hospital Beneficência Portuguesa'

// ============================================
// CONSULTA 6: Listar todos os médicos que podem atender ao plano de saúde de um paciente
// ============================================
// Exemplo: Médicos que podem atender o paciente Roberto Mendes (que tem Unimed)
MATCH (pac:Paciente {nome: 'Roberto Mendes'})-[:POSSUI_PLANO]->(plano:PlanoSaude)<-[:ACEITA_PLANO]-(med:Médico)
OPTIONAL MATCH (med)-[:POSSUI_ESPECIALIDADE]->(esp:Especialidade)
RETURN pac.nome AS Paciente,
       plano.nome AS PlanoSaude,
       med.nome AS MedicoDisponivel,
       med.crm AS CRM,
       collect(esp.nome) AS Especialidades,
       med.telefone AS Telefone
ORDER BY med.nome;

// Para outros pacientes, altere o nome do paciente

// ============================================
// CONSULTA 7: Exibir o total de consultas realizadas por médico
// ============================================
MATCH (med:Médico)<-[:FOI_REALIZADA_POR]-(cons:Consulta)
OPTIONAL MATCH (med)-[:POSSUI_ESPECIALIDADE]->(esp:Especialidade)
RETURN med.nome AS Medico,
       med.crm AS CRM,
       collect(DISTINCT esp.nome) AS Especialidades,
       count(cons) AS TotalConsultas,
       collect({
         data: cons.data,
         horario: cons.horario,
         tipo: cons.tipo
       }) AS DetalhesConsultas
ORDER BY TotalConsultas DESC, med.nome;