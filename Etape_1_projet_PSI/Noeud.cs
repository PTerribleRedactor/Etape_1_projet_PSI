using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Etape_1_projet_PSI
{
    internal class Noeud
    {
        #region Attributs
        int nom; 
        List<int> noeuds_adjacent = new List<int>();
        #endregion

        #region Methodes
        public Noeud(int nom)
        {
            this.nom = nom;
        }

        public void Noeud_adjacent(int N)
        {
            this.noeuds_adjacent.Add(N);
        }
        #endregion

        #region Propriete
        public int Nom { get { return nom; } } 
        public List<int> Noeuds_Adjacent {  get { return noeuds_adjacent;} }
        #endregion
    }
}
