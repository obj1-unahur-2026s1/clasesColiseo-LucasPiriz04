import equipamiento.*
class Gladiador{
    var vida = 100

    method atacar(gladiador){
        gladiador.perderVida(self.poderAtaque() - gladiador.defensa())
        
    }

    method pelearCon(gladiador){
        self.atacar(gladiador)
        gladiador.atacar(self)
    }

    method perderVida(valor){vida -= valor}

    method vida() = vida

    method crearGrupoCon(otroGladiador)

    method curarse(){vida = 100}

    method poderAtaque()
    method destreza()
    method fuerza()
    method defensa()
}

class Mirmillon inherits Gladiador{
    var arma
    var armadura
    var fuerza

    override method destreza() = 15
    override method fuerza() = fuerza


    method cambiarArmadura(nuevaArmadura){armadura = nuevaArmadura}
    method cambiarArma(nuevaArma){arma = nuevaArma}
    method cambiarFueza(cant){fuerza = cant}

    override method poderAtaque() = arma.valorDeAtaque() + fuerza

    override method defensa() = armadura.puntosDeDefensa(self) + self.destreza()

    //override method crearGrupoCon(otroGladiador){
    //    const nuevoGrupo = new Grupo(nombre = "Mirmillolandia")
    //    nuevoGrupo.add(otroGladiador)
    //    nuevoGrupo.add(self)
    //    return nuevoGrupo
    //}

    override method crearGrupoCon(otroGladiador){
        return
    new Grupo(nombre="MIRMILLOLANDIA" , miembros = #{self , otroGladiador})
    }
}

class Dimachaerus inherits Gladiador{
    const armas = []
    var destreza
                
    override method destreza() = destreza
    override method fuerza() = 10

    method agregarArma(arma){armas.add(arma)}

    override method atacar(gladiador){
        super(gladiador)
        destreza += 1
    }

    override method poderAtaque() = self.fuerzaDeArmas() + self.fuerza()

    method fuerzaDeArmas(){
        return armas.sum({p => p.valorDeAtaque()})
    }

    override method defensa() = destreza / 2

    override method crearGrupoCon(otroGladiador){
    return
    new Grupo(nombre="D-" +(self.poderAtaque() + otroGladiador.poderAtaque()).toString() , miembros = #{self , otroGladiador})
    }
}


class Grupo{
    const nombre
    const miembros = #{}
    var cantPeleas = 0
    
    method nombreDelGrupo () = nombre

    method agregarGladiador(unGladiador){miembros.add(unGladiador)}
    method sacarGladiador(unGladiador){miembros.remove(unGladiador)}
    
    method puedenCombatir() = miembros.filter({p => p.vida()>0})

    method campeon() = self.puedenCombatir().max({p => p.poderAtaque()})

    method combatir(otroGrupo){
        self.campeon().pelearCon(otroGrupo.campeon())
        self.campeon().pelearCon(otroGrupo.campeon())
        self.campeon().pelearCon(otroGrupo.campeon())
        cantPeleas += 1
    }
}

object coliseo{
    method combateEntreGrupos(grupo1 , grupo2){
        grupo1.combatirCon(grupo2)
    }

    method combatirContraCampeon(unGrupo , unCampeon){
        unGrupo.miembros().forEach({g => g.pelearCon(unCampeon)})
    }

    method curarGrupo(unGrupo){
        unGrupo.miembros().forEach({g => g.curarse()})
    }

    method curarGladiador(unGladiador){
        unGladiador.curarse()
    }
}