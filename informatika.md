## Základy informatiky

#### Co je to logika? zejména výroková

obor nebo systém, který na základě znalosti pravdivosti vstupních výroků, dokáže u soudit na pravdivost výroků jiných

**Výrok** je sdělení deklarativního typu u kterého ***má smysl*** určovat zda je či není pravdivé

**příklad**
*   $-1 < -2$ *(je výrok, nepravdivý)*
* Merkur je měnší než Venuše.
* Merkur je Slunci blíže než Venuše.
* Dne 04.10.2000 jsem jedl jablka. *(není výrok, ptáme se po objektu který není explicitní)*
* Prší. *(není výrok, není specifikován co to je Prší)*
*nutno specifikovat pojem **Prší** a místo konání*
* $-2 < -1$ *(je výrok, pravdivý)*

**pravidlo odvozovačí** 
* živí lidé dýchají.
* Já jsem živí člověk.

= Já dýchám

* Jestliže jsem snídal pak nemám hlad
* Snídal jsem

= Nemám hlad


**Atomární *(Atomický)* výrok** je takový výrok, který je dále nedělitelný.

**Složený výrok** je takový, ve kterém byla použita alespoň jedna *výroková* spojka.

**Označení pro výroky** 
* používají se malá písmena latinské abecedy, popřípadě indexace $a_x$ = **Proměnné**
* závorky () 
* pravda (1, P, T) / nepravda (0, N, F) = **Konstanty**
* **ph** pravdivostní hodnot

$ph(a) = 0$
$ph(a) = 1$


**Logické spojky**
*Arita* určuje kolik výroků spojujeme
* unární (jeden prvek)
    * negace $\neg$
    * falzum $\mathbb{F}$ vždy 0
    * várum $\mathbb{V}$ vždy 1

* binární spojky (dva výroky => jeden)
    * $\lor$ $\land$

**Ternární spojky**

**Spojky**
$\neg$ $\land$ $\lor$ $=>$ $<=>$

**tautologie** je vždy pravdivý výrok
**kontradicke** je vždy nepracdivý výrok