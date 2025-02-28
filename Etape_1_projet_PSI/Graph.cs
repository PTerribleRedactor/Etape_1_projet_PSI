using Raylib_cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Etape_1_projet_PSI
{
    internal class Graph
    {
        #region Attributs
        Dictionary<int,Noeud> noeuds = new Dictionary<int, Noeud>();
        List<Lien> liens = new List<Lien>();
        int[,] graphe_adjacence = new int[33, 33];
        int nombreNoeuds;
        #endregion

        #region Methode 

        public Graph(string path, int nombreNoeuds)
        {
            this.nombreNoeuds = nombreNoeuds;
            for(int i = 0; i < this.nombreNoeuds; i++)
            {
                for (int j = 0; j < this.nombreNoeuds; j++)
                {
                    graphe_adjacence[i, j] = 0;
                }
            }
            try
            {
                using (StreamReader lecteur = new StreamReader(path))
                {
                    string ligne;
                    Noeud N1;
                    Noeud N2;
                    while ((ligne = lecteur.ReadLine()) != null)
                    {
                        Match match = Regex.Match(ligne, @"\((\d+),\s*(\d+)\)");
                        if (match.Success)
                        {
                            int premier = int.Parse(match.Groups[1].Value);
                            int deuxieme = int.Parse(match.Groups[2].Value);
                            //car non oriente
                            graphe_adjacence[premier, deuxieme] = 1;
                            graphe_adjacence[deuxieme, premier] = 1;

                            if (!noeuds.ContainsKey(premier))
                            {
                                noeuds.Add(premier, new Noeud(premier));
                            }
                            if (!noeuds.ContainsKey(deuxieme))
                            {
                                noeuds.Add(deuxieme, new Noeud(deuxieme));
                            }
                            liens.Add(new Lien(noeuds[premier], noeuds[deuxieme]));
                        }
                        
                    }
                }
            }
            catch(Exception e)
            {

            }
        }

        public void affiche_graphe_adjacencte()
        {
            for (int i = 0; i < this.nombreNoeuds; i++)
            {
                for (int j = 0; j < this.nombreNoeuds; j++)
                {
                    Console.Write(graphe_adjacence[i, j]);
                }
                Console.WriteLine();
            }
        }

        public List<List<int>> Creer_List_Adjacence()
        {
            List<List<int>> listadjacence = new List<List<int>>();
            List<int> iadjacent = new List<int>();
            for (int i = 0; i < this.nombreNoeuds; i++)
            {
                iadjacent = new List<int>();
                for (int j = 0; j < this.nombreNoeuds; j++)
                {
                    if (this.graphe_adjacence[i,j] == 1)
                    {
                        iadjacent.Add(j);
                    }
                }
                listadjacence.Add(iadjacent);
            }
            return listadjacence;
        }

        public void Afficher_List_Adjacence()
        {
            List<List<int>> listadjacence = Creer_List_Adjacence();
            int count = 0;
            foreach(List<int> list in listadjacence)
            {
                Console.Write(count + ": {");
                foreach (int num in list)
                {
                    Console.Write(num + ",");
                }
                Console.Write("}");
                count++;
                Console.WriteLine();
            }
        }

        public int DFS(int depart)
        {
            int noeuds_visitee_total = 0;
            List<int> visite = new List<int>();
            Stack<int> pile = new Stack<int>();

            pile.Push(depart);

            Console.Write("Parcours DFS : ");

            while (pile.Count > 0)
            {
                int noeudCourant = pile.Pop();

                if (!visite.Contains(noeudCourant))
                {
                    Console.Write(noeudCourant + " ");
                    noeuds_visitee_total++;
                    visite.Add(noeudCourant);

                    foreach (int noeudAdjacent in this.noeuds[noeudCourant].Noeuds_Adjacent)
                    {
                        if (!visite.Contains(noeudAdjacent))
                        {
                            pile.Push(noeudAdjacent);
                        }
                    }
                }
            }

            Console.WriteLine();
            return noeuds_visitee_total;
        }

        public int BFS(int depart)
        {
            int noeuds_visitee_total = 0;
            List<int> visite = new List<int>();
            Queue<int> file = new Queue<int>();

            visite.Add(depart);
            file.Enqueue(depart);

            Console.Write("Parcours BFS : ");

            while (file.Count > 0)
            {
                int noeudCourant = file.Dequeue();
                Console.Write(noeudCourant + " ");
                noeuds_visitee_total++;

                foreach (int noeudAdjacent in this.noeuds[noeudCourant].Noeuds_Adjacent)
                {
                    if (!visite.Contains(noeudAdjacent))
                    {
                        visite.Add(noeudAdjacent);
                        file.Enqueue(noeudAdjacent);
                    }
                }
            }

            Console.WriteLine();
            return noeuds_visitee_total;
        }

        public bool Verification_Connexite() //trouver le nombre de composante connexe 
        {
            Console.WriteLine("\n\t\tVerification de connexite\n");
            
            bool verifie = true;
            int i = 0;
            foreach(Noeud noeud in this.noeuds.Values)
            {
                Console.Write(noeud.Nom + " : ");
                i = DFS(noeud.Nom);
                if (i != noeuds.Count)
                {
                    verifie = false;
                }
            }
            return verifie;
        }

        public int DFS_detection_circuit(int depart)
        {
            int nb_circuit = 0;
            List<int> visite = new List<int>();
            Stack<int> pile = new Stack<int>();

            pile.Push(depart);
            while (pile.Count > 0)
            {
                int noeudCourant = pile.Pop();

                if (!visite.Contains(noeudCourant))
                {
                    visite.Add(noeudCourant);

                    foreach (int noeudAdjacent in this.noeuds[noeudCourant].Noeuds_Adjacent)
                    {
                        if (!visite.Contains(noeudAdjacent))
                        {
                            pile.Push(noeudAdjacent);
                            nb_circuit++;
                        }
                    }
                }
            }
            return nb_circuit;
        }

        public void description_Ordre_Taille()
        {
            Console.WriteLine("l'ordre du Graph est : " + noeuds.Count);
            
        }


        public void Draw_Graph()
        {
            const int nodeRadius = 20;
            const int screenWidth = 800;
            const int screenHeight = 600;
            List<List<int>> list_adjacence = Creer_List_Adjacence();

            Raylib.InitWindow(screenWidth, screenHeight, "Graph Visualization");
            Raylib.SetTargetFPS(60);

            // Calculate node positions
            Vector2[] nodePositions = new Vector2[nombreNoeuds];
            for (int i = 0; i < nombreNoeuds; i++)
            {
                float angle = i * (2 * MathF.PI / nombreNoeuds);
                float x = screenWidth / 2 + 250 * MathF.Cos(angle);
                float y = screenHeight / 2 + 250 * MathF.Sin(angle);
                nodePositions[i] = new Vector2(x, y);
            }

            while (!Raylib.WindowShouldClose())
            {
                Raylib.BeginDrawing();
                Raylib.ClearBackground(Color.White);

                // Draw edges
                for (int i = 0; i < nombreNoeuds; i++)
                {
                    foreach (int j in list_adjacence[i])
                    {
                        Raylib.DrawLine((int)nodePositions[i].X, (int)nodePositions[i].Y,
                                        (int)nodePositions[j].X, (int)nodePositions[j].Y, Color.Gray);
                    }
                }

                // Draw nodes
                for (int i = 0; i < nombreNoeuds; i++)
                {
                    Raylib.DrawCircle((int)nodePositions[i].X, (int)nodePositions[i].Y, nodeRadius, Color.Blue);
                    Raylib.DrawText(i.ToString(), (int)nodePositions[i].X - 10, (int)nodePositions[i].Y - 10, 20, Color.White);
                }

                Raylib.EndDrawing();
            }

            Raylib.CloseWindow();
        }

        #endregion

        #region Propriete

        #endregion
    }
}

/*
 if(!Noeud_Existe(premier))
    {
        N1 = new Noeud(premier);
        noeuds.Add(N1);
    }
    if(!Noeud_Existe(deuxieme))
    {
        N2 = new Noeud(deuxieme);
        noeuds.Add(N2);
    }
    N1.Noeud_adjacent(N2);
    N2.Noeud_adjacent(N1);
 */
