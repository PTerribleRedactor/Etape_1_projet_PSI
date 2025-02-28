using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Etape_1_projet_PSI
{
    internal class Lien
    {
        #region Attributs
        Noeud N1;
        Noeud N2;
        #endregion

        #region Methode
        public Lien(Noeud N1, Noeud N2)
        {
            this.N1 = N1;
            this.N2 = N2;
            this.N1.Noeud_adjacent(this.N2.Nom);
            this.N2.Noeud_adjacent(this.N1.Nom);
        }
        #endregion

        #region Propriete
        public Noeud Noeud1 { get { return this.N1; } }
        public Noeud Noeud2 { get { return this.N2; } }
        #endregion
    }
}
