class Paciente {
  var edad
  var fortalezaMuscular
  var dolor
  method edad() = edad
  method fortalezaMuscular() = fortalezaMuscular
  method dolor() = dolor
  // no los hago property porque estaría mal.

  method puedeUsar(unAparato) {
    return
    unAparato.puedeSerUsadoPor(self)
  }
  method usar(unAparato) {
    if(!self.puedeUsar(unAparato)) {
      self.error("El paciente no puede usar ese aparato.")
    }
    unAparato.esUsadoPor(self)
  }
  method disminuirDolor(unValor) {dolor=(dolor-unValor).max(0)}
  method aumentarFortaleza(unValor) {fortalezaMuscular=fortalezaMuscular+unValor}
}

class Magneto {
  method esUsadoPor(unPaciente) {unPaciente.disminuirDolor(unPaciente.dolor()*0.1)}
  method puedeSerUsadoPor(unPaciente) {
    return true
  }
}

class Bici {
  method esUsadoPor(unPaciente) {
    unPaciente.disminuirDolor(4)
    unPaciente.aumentarFortaleza(3)
  }
  method puedeSerUsadoPor(unPaciente) {
    return
    unPaciente.edad() > 8
  }
}

class Minitramp {
  method esUsadoPor(unPaciente) {
    unPaciente.aumentarFortaleza(unPaciente.edad() * 0.1)
  }
  method puedeSerUsadoPor(unPaciente) {
    return
    unPaciente.dolor() < 20
  }
}
