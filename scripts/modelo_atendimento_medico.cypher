// ============================================
// SISTEMA DE ATENDIMENTO MÉDICO
// ============================================

// Criar todas as especialidades
CREATE (esp1:Especialidade {nome: 'Pediatra', codigo: 'PED'})
CREATE (esp2:Especialidade {nome: 'Oftalmologista', codigo: 'OFT'})
CREATE (esp3:Especialidade {nome: 'Cardiologista', codigo: 'CAR'})

// Criar todos os médicos
CREATE (med1:Médico {nome: 'Dr. João Silva', crm: 'CRM12345', telefone: '(11) 98765-4321'})
CREATE (med2:Médico {nome: 'Dra. Maria Santos', crm: 'CRM23456', telefone: '(11) 98765-4322'})
CREATE (med3:Médico {nome: 'Dr. Carlos Oliveira', crm: 'CRM34567', telefone: '(11) 98765-4323'})
CREATE (med4:Médico {nome: 'Dra. Ana Costa', crm: 'CRM45678', telefone: '(11) 98765-4324'})
CREATE (med5:Médico {nome: 'Dr. Pedro Alves', crm: 'CRM56789', telefone: '(11) 98765-4325'})
CREATE (med6:Médico {nome: 'Dra. Juliana Ferreira', crm: 'CRM67890', telefone: '(11) 98765-4326'})

// Associar médicos às especialidades
CREATE (med1)-[:POSSUI_ESPECIALIDADE]->(esp1)
CREATE (med2)-[:POSSUI_ESPECIALIDADE]->(esp1)
CREATE (med3)-[:POSSUI_ESPECIALIDADE]->(esp2)
CREATE (med4)-[:POSSUI_ESPECIALIDADE]->(esp2)
CREATE (med5)-[:POSSUI_ESPECIALIDADE]->(esp3)
CREATE (med6)-[:POSSUI_ESPECIALIDADE]->(esp3)

// Criar todos os hospitais
CREATE (hosp1:Hospital {nome: 'Hospital São Paulo', endereco: 'Av. Paulista, 1000', telefone: '(11) 3456-7890'})
CREATE (hosp2:Hospital {nome: 'Hospital Albert Einstein', endereco: 'Av. Albert Einstein, 627', telefone: '(11) 2151-1233'})
CREATE (hosp3:Hospital {nome: 'Hospital Sírio-Libanês', endereco: 'Rua Dona Adma Jafet, 91', telefone: '(11) 3155-0200'})
CREATE (hosp4:Hospital {nome: 'Hospital das Clínicas', endereco: 'Av. Dr. Enéas de Carvalho Aguiar, 255', telefone: '(11) 2661-0000'})
CREATE (hosp5:Hospital {nome: 'Hospital Beneficência Portuguesa', endereco: 'Rua Maestro Cardim, 769', telefone: '(11) 3505-1000'})

// Associar médicos aos hospitais
CREATE (med1)-[:ATENDE_EM {desde: '2020-01-15'}]->(hosp1)
CREATE (med3)-[:ATENDE_EM {desde: '2019-03-20'}]->(hosp1)
CREATE (med5)-[:ATENDE_EM {desde: '2021-06-10'}]->(hosp1)
CREATE (med2)-[:ATENDE_EM {desde: '2018-05-12'}]->(hosp2)
CREATE (med4)-[:ATENDE_EM {desde: '2020-08-25'}]->(hosp2)
CREATE (med6)-[:ATENDE_EM {desde: '2019-11-30'}]->(hosp2)
CREATE (med1)-[:ATENDE_EM {desde: '2021-02-14'}]->(hosp3)
CREATE (med3)-[:ATENDE_EM {desde: '2020-07-08'}]->(hosp3)
CREATE (med2)-[:ATENDE_EM {desde: '2019-09-18'}]->(hosp4)
CREATE (med5)-[:ATENDE_EM {desde: '2020-12-05'}]->(hosp4)
CREATE (med6)-[:ATENDE_EM {desde: '2021-04-22'}]->(hosp4)
CREATE (med4)-[:ATENDE_EM {desde: '2018-10-30'}]->(hosp5)
CREATE (med5)-[:ATENDE_EM {desde: '2020-03-15'}]->(hosp5)

// Criar planos de saúde
CREATE (plano1:PlanoSaude {nome: 'Unimed', codigo: 'UNI001', tipo: 'Premium'})
CREATE (plano2:PlanoSaude {nome: 'Amil', codigo: 'AMI001', tipo: 'Standard'})
CREATE (plano3:PlanoSaude {nome: 'SulAmérica', codigo: 'SUL001', tipo: 'Básico'})

// Associar médicos aos planos de saúde
CREATE (med1)-[:ACEITA_PLANO {desde: '2020-01-01'}]->(plano1)
CREATE (med3)-[:ACEITA_PLANO {desde: '2019-06-01'}]->(plano1)
CREATE (med5)-[:ACEITA_PLANO {desde: '2021-01-01'}]->(plano1)
CREATE (med6)-[:ACEITA_PLANO {desde: '2020-03-01'}]->(plano1)
CREATE (med2)-[:ACEITA_PLANO {desde: '2018-01-01'}]->(plano2)
CREATE (med4)-[:ACEITA_PLANO {desde: '2020-01-01'}]->(plano2)
CREATE (med5)-[:ACEITA_PLANO {desde: '2019-01-01'}]->(plano2)
CREATE (med1)-[:ACEITA_PLANO {desde: '2020-05-01'}]->(plano3)
CREATE (med3)-[:ACEITA_PLANO {desde: '2021-01-01'}]->(plano3)
CREATE (med4)-[:ACEITA_PLANO {desde: '2020-08-01'}]->(plano3)
CREATE (med6)-[:ACEITA_PLANO {desde: '2021-02-01'}]->(plano3)

// Criar pacientes
CREATE (pac1:Paciente {nome: 'Roberto Mendes', cpf: '123.456.789-00', dataNascimento: '1985-05-15', telefone: '(11) 91234-5678'})
CREATE (pac2:Paciente {nome: 'Fernanda Lima', cpf: '234.567.890-11', dataNascimento: '1990-08-22', telefone: '(11) 92345-6789'})
CREATE (pac3:Paciente {nome: 'Lucas Rodrigues', cpf: '345.678.901-22', dataNascimento: '1978-12-03', telefone: '(11) 93456-7890'})
CREATE (pac4:Paciente {nome: 'Patricia Souza', cpf: '456.789.012-33', dataNascimento: '1995-03-18', telefone: '(11) 94567-8901'})
CREATE (pac5:Paciente {nome: 'Marcos Pereira', cpf: '567.890.123-44', dataNascimento: '1982-07-25', telefone: '(11) 95678-9012'})

// Associar pacientes aos planos de saúde
CREATE (pac1)-[:POSSUI_PLANO {desde: '2020-01-10', numeroCarteirinha: 'UNI123456'}]->(plano1)
CREATE (pac2)-[:POSSUI_PLANO {desde: '2019-06-15', numeroCarteirinha: 'AMI234567'}]->(plano2)
CREATE (pac3)-[:POSSUI_PLANO {desde: '2021-03-20', numeroCarteirinha: 'UNI345678'}]->(plano1)
CREATE (pac4)-[:POSSUI_PLANO {desde: '2020-09-05', numeroCarteirinha: 'SUL456789'}]->(plano3)
CREATE (pac5)-[:POSSUI_PLANO {desde: '2018-11-12', numeroCarteirinha: 'AMI567890'}]->(plano2)

// Criar consultas
CREATE (cons1:Consulta {data: '2024-01-15', horario: '09:00', tipo: 'Consulta de Rotina', observacoes: 'Paciente em bom estado geral'})
CREATE (cons2:Consulta {data: '2024-02-20', horario: '14:30', tipo: 'Consulta de Retorno', observacoes: 'Acompanhamento pós-cirurgia'})
CREATE (cons3:Consulta {data: '2024-03-10', horario: '10:15', tipo: 'Consulta de Rotina', observacoes: 'Exame de rotina realizado'})
CREATE (cons4:Consulta {data: '2024-03-25', horario: '16:00', tipo: 'Consulta de Emergência', observacoes: 'Atendimento de urgência'})
CREATE (cons5:Consulta {data: '2024-04-05', horario: '11:00', tipo: 'Consulta de Rotina', observacoes: 'Paciente assintomático'})
CREATE (cons6:Consulta {data: '2024-04-18', horario: '08:30', tipo: 'Consulta de Retorno', observacoes: 'Acompanhamento de tratamento'})
CREATE (cons7:Consulta {data: '2024-05-02', horario: '13:45', tipo: 'Consulta de Rotina', observacoes: 'Check-up anual'})
CREATE (cons8:Consulta {data: '2024-05-15', horario: '15:30', tipo: 'Consulta de Rotina', observacoes: 'Exame de vista realizado'})
CREATE (cons9:Consulta {data: '2024-06-01', horario: '09:30', tipo: 'Consulta de Retorno', observacoes: 'Acompanhamento cardíaco'})
CREATE (cons10:Consulta {data: '2024-06-20', horario: '10:00', tipo: 'Consulta de Rotina', observacoes: 'Consulta pediátrica de rotina'})

// Associar consultas aos pacientes e médicos
CREATE (pac1)-[:REALIZOU]->(cons1)
CREATE (cons1)-[:FOI_REALIZADA_POR]->(med1)
CREATE (pac2)-[:REALIZOU]->(cons2)
CREATE (cons2)-[:FOI_REALIZADA_POR]->(med4)
CREATE (pac3)-[:REALIZOU]->(cons3)
CREATE (cons3)-[:FOI_REALIZADA_POR]->(med5)
CREATE (pac1)-[:REALIZOU]->(cons4)
CREATE (cons4)-[:FOI_REALIZADA_POR]->(med3)
CREATE (pac4)-[:REALIZOU]->(cons5)
CREATE (cons5)-[:FOI_REALIZADA_POR]->(med2)
CREATE (pac5)-[:REALIZOU]->(cons6)
CREATE (cons6)-[:FOI_REALIZADA_POR]->(med6)
CREATE (pac2)-[:REALIZOU]->(cons7)
CREATE (cons7)-[:FOI_REALIZADA_POR]->(med3)
CREATE (pac3)-[:REALIZOU]->(cons8)
CREATE (cons8)-[:FOI_REALIZADA_POR]->(med4)
CREATE (pac4)-[:REALIZOU]->(cons9)
CREATE (cons9)-[:FOI_REALIZADA_POR]->(med5)
CREATE (pac5)-[:REALIZOU]->(cons10)
CREATE (cons10)-[:FOI_REALIZADA_POR]->(med1)