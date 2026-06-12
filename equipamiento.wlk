class Espada{
    const longitud
    const filo

    method valorDeAtaque(){longitud * filo}
}


class Contundente{
    const peso

    method valorDeAtaque()=peso
}

object escudo{
    method puntosDeDefensa(luchador) = 5 + luchador.destreza() * 0.1
}

object casco{
    method puntosDeDefensa(luchador) = 10
}