# Ruleta-Tontolona-Dev

Juego simple en **Godot 3.6** inspirado en dinámicas de ruleta para fiestas y reuniones.

## ¿Qué incluye?

- Una ruleta con 8 secciones de retos aleatorios.
- Botón **GIRAR** para iniciar el giro.
- Selección automática del reto ganador cuando la ruleta se detiene.

## Ejecutar el proyecto

1. Abre Godot **3.6**.
2. Importa este proyecto seleccionando `project.godot`.
3. Ejecuta la escena principal.

La escena inicial está en: `res://scenes/main.tscn`.

## Nota sobre binarios

Este repo usa `icon.svg` (texto plano) para evitar problemas en PRs donde no se admiten binarios.

## Personalización rápida

Puedes editar los retos en `scripts/wheel.gd`, dentro del arreglo `slices`.
