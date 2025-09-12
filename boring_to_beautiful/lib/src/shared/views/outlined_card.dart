// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Cartão com borda contornada.
class OutlinedCard extends StatefulWidget {
  const OutlinedCard({Key? key, required this.child, this.clickable = true})
    : super(key: key);

  final Widget child;
  final bool clickable;

  @override
  State<OutlinedCard> createState() => _OutlinedCardState();
}

/// Estado do cartão contornado.
class _OutlinedCardState extends State<OutlinedCard> {
  bool _hovered = false;

  // Animação ao passar o mouse
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(_hovered ? 20 : 8);
    const animationCurve = Curves.easeInOut;

    return MouseRegion(
      // quando mouse entrar
      onEnter: (_) {
        if (!widget.clickable) return;
        setState(() {
          _hovered = true;
        });
      },
      // quando mouse sair
      onExit: (_) {
        if (!widget.clickable) return;
        setState(() {
          _hovered = false;
        });
      },
      // mudar o cursor do mouse
      cursor: widget.clickable
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,

      child: AnimatedContainer(
        duration: kThemeAnimationDuration, // duração da animação
        curve: animationCurve, // curva de animação
        decoration: BoxDecoration(
          // borda do card
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          borderRadius: borderRadius,
        ),
        foregroundDecoration: BoxDecoration(
          // destacar background-color ao passar o mouse
          color: Theme.of(
            context,
          ).colorScheme.onSurface.withValues(alpha: _hovered ? 0.12 : 0),
          borderRadius: borderRadius,
        ),
        // Conteúdo do card
        child: TweenAnimationBuilder<BorderRadius>(
          duration: kThemeAnimationDuration, // duração da animação
          curve: animationCurve, // curva de animação
          tween: Tween(
            // animação da borda
            begin: BorderRadius.zero,
            end: borderRadius,
          ),
          builder: (context, borderRadius, child) => ClipRRect(
            clipBehavior: Clip.antiAlias, // recortar o conteúdo
            borderRadius: borderRadius, // borda animada
            child: child, // conteúdo do card
          ),
          child: widget.child, // conteúdo do card
        ),
      ),
    );
  }
}
