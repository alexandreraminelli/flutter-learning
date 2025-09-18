import "package:fitness/models/category_model.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:lucide_icons/lucide_icons.dart";

/// Página inicial do app
class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  // Obter lista de categorias
  List<CategoryModel> categories = [];
  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    // Layout Scaffold
    return Scaffold(
      // Aparência
      backgroundColor: Colors.white,
      // Layout
      appBar: appBar(),
      // Conteúdo
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_searchField(), SizedBox(height: 40), _categorySection()],
      ),
    );
  }

  /// Barra superior do app.
  AppBar appBar() {
    return AppBar(
      // Aparência da AppBar
      backgroundColor: Colors.white,
      elevation: 0,
      // Título da página
      title: Text(
        "Breakfast",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      // Botão de voltar (início da appBar)
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // quadrado com background ao redor (parecer um botão)
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(LucideIcons.chevronLeft),
        ),
      ),
      // Botões no fim da appBar
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              // quadrado com background ao redor (parecer um botão)
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(LucideIcons.menu),
          ),
        ),
      ],
    );
  }

  /// Caixa de pesquisa
  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withAlpha(12),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          // Placeholder
          hintText: "Search Pancake",
          hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          // background
          filled: true,
          fillColor: Colors.white,
          // espaçamento interno
          contentPadding: EdgeInsets.all(15),
          // remover borda e add cantos arredondados
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          // Ícones
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(LucideIcons.search),
          ),
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 0.1, // espessura
                    indent: 10, // limitar tamanho
                    endIndent: 10,
                  ), // divisor
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(LucideIcons.filter),
                  ), // botão de filtro
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Seção de categorias
  Widget _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        // Título
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Text(
                "Category", // Título
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        // Lista de categorias
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length, // quantidade de elementos
            scrollDirection: Axis.horizontal, // direção de rolagem
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Ícone da categoria
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(categories[index].iconPath),
                    ),
                    // Nome da categoria
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
