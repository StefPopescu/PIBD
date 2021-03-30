package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Orase;
import pojo.Teatre;
import DAOlmpl.TeatreDaolmpl;
import DAOlmpl.HibernateUtil;
import org.hibernate.Session;


public class TeatreController extends HttpServlet {

	Teatre teatru = new Teatre();
	TeatreDaolmpl teatruDaolmpl = new TeatreDaolmpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaTeatru") != null) {
			// preluarea parametrilor de interes
			Integer idoras = java.lang.Integer.parseInt(request.getParameter("idoras"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Orase oras = (Orase) session.get(Orase.class, idoras);

			String nume = request.getParameter("nume");
			String adresa = request.getParameter("adresa");
			Integer capacitate = Integer.parseInt(request.getParameter("capacitate"));

			teatru.setOrase(oras);
			teatru.setNume(nume);
			teatru.setAdresa(adresa);
			teatru.setCapacitate(capacitate);

			teatruDaolmpl.adaugaTeatre(teatru);
			RequestDispatcher rd = request.getRequestDispatcher("add_Teatru.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaTeatre") != null) {
			List<Teatre> listaTeatre = new ArrayList();
			listaTeatre = teatruDaolmpl.afiseazaTeatre();
			request.setAttribute("listaTeatre", listaTeatre);
			RequestDispatcher rd = request.getRequestDispatcher("Teatre.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaTeatru") != null) {
			Integer id1 = Integer.parseInt(request.getParameter("idteatru"));
			// preluarea parametrilor de interes
			Integer idoras = java.lang.Integer.parseInt(request.getParameter("idoras"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Orase oras = (Orase) session.get(Orase.class, idoras);	

			String nume = request.getParameter("nume");
			String adresa = request.getParameter("adresa");
			Integer capacitate = Integer.parseInt(request.getParameter("capacitate"));

			teatruDaolmpl.modificaTeatre(id1, oras, nume, adresa, capacitate);
			RequestDispatcher rd = request.getRequestDispatcher("add_Teatru.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeTeatru") != null) {
			int id2 = Integer.parseInt(request.getParameter("idteatru"));
			teatru.setIdteatru(id2);
			teatruDaolmpl.stergeTeatru(teatru);
			RequestDispatcher rd = request.getRequestDispatcher("add_Teatru.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}


